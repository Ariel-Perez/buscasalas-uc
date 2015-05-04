class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :classrom_id
      t.integer :block_id
      t.date :date

      t.timestamps null: false
    end
  end
end
