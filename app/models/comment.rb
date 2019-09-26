# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :notifications, as: :subject

  paginates_per 10

  after_create :notify_user

  private

  def notify_user
    Notification.notify_for_post_commented(users: [ post.user ], subject: self)
  end

end
