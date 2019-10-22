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
  has_many :likes

  has_one_attached :main_picture

  validates :title, :description, :main_picture, presence: true

  paginates_per 2

  after_create :notify_users

  def liked_by_user?(user)
    Like.exists?(user: user, post: self)
  end

  def like!(user)
    unless liked_by_user?(user)
      Like.create!(user: user, post: self)
    end
  end

  def unlike!(user)
    if liked_by_user?(user)
      Like.find_by(user: user, post: self).destroy
    end
  end

  def likes_count
    Like.where(post: self).count
  end

  private

  def notify_users
    users = User.where.not(id: self.user.id)
    Notification.notify_for_post_created(users: users, subject: self)
  end

end
