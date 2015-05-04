class RenameClassromToClassroomsAtScheduleTable < ActiveRecord::Migration
  def change
    rename_column :schedules, :classrom_id, :classroom_id
  end
end
