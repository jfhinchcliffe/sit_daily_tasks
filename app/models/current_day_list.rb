class CurrentDayList < ActiveRecord::Base
  has_many :daily_tasks
  validates :title, uniqueness: true
end
