class Schedule < ActiveRecord::Base
  belongs_to :classrom
  belongs_to :block
end
