# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :notifications, as: :subject

  has_one_attached :main_picture

  validates :title, :description, :main_picture, presence: true

  paginates_per 2

  after_create :notify_users

  private

  def notify_users
    users = User.where.not(id: self.user.id)
    Notification.notify_for_post_commented(users: users, subject: self)
  end

end
