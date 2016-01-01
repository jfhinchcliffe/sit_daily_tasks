class CreateCurrentDayLists < ActiveRecord::Migration
  def change
    create_table :current_day_lists do |t|
      t.string :title
      t.datetime :date
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
