# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  content      :text
#  read         :boolean
#  user_id      :integer          not null
#  subject_type :string
#  subject_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :subject, polymorphic: true, optional: true

  scope :posts, -> { where(subject_type: 'Post') }
  scope :comments, -> { where(subject_type: 'Comment') }
  scope :unread, -> { where(read: false) }

  default_scope { order('updated_at desc') }

  before_save :set_attr, if: :new_record?

  paginates_per 5

  def read!
    update_attribute(:read, true)
  end

  def self.send_to(users:, content:, subject:)
    users.each { |user| Notification.create! user: user, content: content, subject: subject }
  end

  def self.notify_for_post_created(users:, subject:)
    content_text = "Пользователь #{subject.user.full_name} создал новый пост."
    send_to(users: users, content: content_text, subject: subject)
  end

  def self.notify_for_post_commented(users:, subject:)
    if subject.post.user != subject.user
      content_text = "Пользователь #{subject.user.full_name} прокомментировал ваш пост."
      send_to(users: users, content: content_text, subject: subject)
    end
  end

  private

  def set_attr
    self.read = false
  end

end
