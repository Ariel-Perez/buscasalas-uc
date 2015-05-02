class InitializeDataModel < ActiveRecord::Migration
  def change
    create_table "blocks", force: :cascade do |t|
      t.string   "start_time"
      t.string   "end_time"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "campus", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "default"
    end

    create_table "classrooms", force: :cascade do |t|
      t.string   "name"
      t.integer  "campus_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
