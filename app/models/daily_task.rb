class DailyTask < ActiveRecord::Base
  belongs_to :current_day_list
end
