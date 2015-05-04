# == Schema Information
#
# Table name: schedules
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  block_id     :integer
#  date         :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  activity     :string
#

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
