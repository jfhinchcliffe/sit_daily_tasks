class Task < ActiveRecord::Base
  validates_presence_of :title, :description, :date_schedule
end
