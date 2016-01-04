class StaticPagesController < ApplicationController
  include CurrentDayListHelper
  before_action :authenticate_user!
  def home
    #current date for title of homepage
    @current_date = Date.today.strftime("%A %d %B, %Y")
    # call method to get all current tasks for the current day
    current_tasks = populate_current_tasks
    #create a new CurretnDayList if one isn't already created
    @current_day_list = CurrentDayList.find_or_create_by(title: @current_date)
    #instantiate daily tasks array
    @daily_tasks = []
    #populate_currentdaylist(current_tasks)
    @complete_task_count = 0
    @incomplete_task_count = 0
    #run through each task in the array and create
    #a daily task, owned by the current day.
    current_tasks.each do |cst|
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
