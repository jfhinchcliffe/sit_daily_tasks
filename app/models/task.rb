class Task < ActiveRecord::Base
  validates_presence_of :title, :description, :date_schedule
  validates_uniqueness_of :title
end
