# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :main_picture

  paginates_per 2
end
