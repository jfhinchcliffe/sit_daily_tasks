class AddCurrentDayListToDailyTasks < ActiveRecord::Migration
  def change
    add_reference :daily_tasks, :current_day_list, index: true, foreign_key: true
  end
end
