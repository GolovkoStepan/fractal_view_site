# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  gender                 :string
#  bio                    :text
#  status                 :integer
#  role                   :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  date_of_birth          :datetime
#

class User < ApplicationRecord
  include TranslateEnum

  has_many :notifications

  has_one_attached :avatar

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: %I[user moderator admin]
  translate_enum :role

  enum status: %I[active banned blocked]
  translate_enum :status

  paginates_per 8

  def full_name
    [first_name, last_name].join(' ')
  end

end
