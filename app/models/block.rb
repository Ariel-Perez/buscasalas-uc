class Block < ActiveRecord::Base
  has_many :schedules

  def timespan
    start_time + ' - ' + end_time
  end
end
