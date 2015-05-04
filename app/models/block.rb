# == Schema Information
#
# Table name: blocks
#
#  id         :integer          not null, primary key
#  start_time :string
#  end_time   :string
#  created_at :datetime
#  updated_at :datetime
#

class Block < ActiveRecord::Base
  has_many :schedules

  def timespan
    start_time + ' - ' + end_time
  end
end
