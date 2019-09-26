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

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
