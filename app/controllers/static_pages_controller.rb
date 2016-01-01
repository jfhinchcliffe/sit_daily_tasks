class StaticPagesController < ApplicationController
  def home
    #current date for title of homepage
    @current_date = Date.today.strftime("%A %d %B, %Y")
    #current day for verification below
    current_day = Date.today.strftime("%A").to_s.downcase
    #initialising array
    @current_scheduled_tasks = []
    #looks for match on current day and where appropriate
    #task day is set to 'true', adding task to array.
    Task.all.each do |task|
      if current_day == "monday" && task.monday == true
        @current_scheduled_tasks.push(task)
      elsif current_day == "tuesday" && task.tuesday == true
        @current_scheduled_tasks.push(task)
      elsif current_day == "wednesday" && task.wednesday == true
        @current_scheduled_tasks.push(task)
      elsif current_day == "thursday" && task.thursday == true
        @current_scheduled_tasks.push(task)
      elsif current_day == "friday" && task.friday == true
        @current_scheduled_tasks.push(task)
      elsif current_day == "saturday" && task.saturday == true
        @current_scheduled_tasks.push(task)
      elsif current_day == "sunday" && task.sunday == true
        @current_scheduled_tasks.push(task)
      end
    end
  end
end
