# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  name       :string
#  campus_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Classroom < ActiveRecord::Base
  belongs_to :campus
  has_many :schedules


  def self.best_option(alternatives)
    best = []

    alternatives.each do |alternative|
      best.push alternative[0]
    end

    return best
  end

  def self.options(blocks, campus, date)
    current_options = []

    blocks.each do |block|
      not_viable = Schedule.where(date: date, block_id: block.id).pluck(:classroom_id).uniq
      current_options.push Classroom.where(campus_id: campus).where.not(id: not_viable)
    end

    return current_options
  end
end
