# == Schema Information
#
# Table name: social_media
#
#  id         :bigint           not null, primary key
#  site_name  :string
#  site_url   :string
#  icon_class :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SocialMedia < ApplicationRecord
end
