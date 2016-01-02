class StaticPagesController < ApplicationController
  def home
    #current date for title of homepage
    @current_date = Date.today.strftime("%A %d %B, %Y")
    #@current_date = "Sunday 3 January, 2016"
    #current day for verification below
    current_day = Date.today.strftime("%A").to_s.downcase
    #current_day = "sunday"
    #initialising array
    current_scheduled_tasks = []
    #creates an array of tasks where current day matches and
    # the day boolean is checked as 'true'
    Task.all.each do |task|
      if current_day == "monday" && task.monday == true
        current_scheduled_tasks.push(task)
      elsif current_day == "tuesday" && task.tuesday == true
        current_scheduled_tasks.push(task)
      elsif current_day == "wednesday" && task.wednesday == true
        current_scheduled_tasks.push(task)
      elsif current_day == "thursday" && task.thursday == true
        current_scheduled_tasks.push(task)
      elsif current_day == "friday" && task.friday == true
        current_scheduled_tasks.push(task)
      elsif current_day == "saturday" && task.saturday == true
        current_scheduled_tasks.push(task)
      elsif current_day == "sunday" && task.sunday == true
        current_scheduled_tasks.push(task)
      end
    end
    #create a new CurretnDayList if one isn't already created
    @current_day_list = CurrentDayList.find_or_create_by(title: @current_date)
    #instantiate daily tasks array
    @daily_tasks = []
    @complete_task_count = 0
    @incomplete_task_count = 0
    #run through each task in the array and create a daily task,
    # owned by the current day.
    current_scheduled_tasks.each do |cst|
      @cdl = @current_day_list.daily_tasks.find_or_create_by(title: cst.title, description: cst.description, complete: [true, false])
      @daily_tasks.push(@cdl)
      if @cdl.complete == true
        @complete_task_count += 1
      elsif @cdl.complete == false
        @incomplete_task_count += 1
      end
    end



  end

end
