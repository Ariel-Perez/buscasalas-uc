# == Schema Information
#
# Table name: campus
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#  default    :boolean
#

class Campus < ActiveRecord::Base
  has_many :classrooms
end
