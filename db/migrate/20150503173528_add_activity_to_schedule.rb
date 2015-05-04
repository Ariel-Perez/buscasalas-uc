class AddActivityToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :activity, :string
  end
end
