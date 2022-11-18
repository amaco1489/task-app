class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :start_day
      t.date :end_day
      t.boolean :all_day, null: false, default: false
      t.datetime :updated_at
    end
  end
end
