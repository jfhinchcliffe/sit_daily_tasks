class CreateDailyTasks < ActiveRecord::Migration
  def change
    create_table :daily_tasks do |t|
      t.string :title
      t.string :description
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
