module CurrentDayListHelper

  def populate_currentdaylist(current_tasks)
    @current_date = Date.today.strftime("%A %d %B, %Y")
    @current_day_list = CurrentDayList.find_or_create_by(title: @current_date)
    @complete_task_count = 0
    @incomplete_task_count = 0
    @daily_tasks = []
    @current_tasks = current_tasks
    current_tasks.each do |ct|
      cdl = @current_day_list.daily_tasks.find_or_create_by(title: ct.title, description: ct.description, complete: [true, false])
      @daily_tasks.push(@cdl)
      if cdl.complete == true
        @complete_task_count += 1
      elsif cdl.complete == false
        @incomplete_task_count += 1
      end
    end
  end

  def populate_current_tasks
    current_day = Date.today.strftime("%A").to_s.downcase
    current_tasks = []
    Task.all.each do |task|
      if task.repeats == true
        if current_day == "monday" && task.monday == true
          current_tasks.push(task)
        elsif current_day == "tuesday" && task.tuesday == true
          current_tasks.push(task)
        elsif current_day == "wednesday" && task.wednesday == true
          current_tasks.push(task)
        elsif current_day == "thursday" && task.thursday == true
          current_tasks.push(task)
        elsif current_day == "friday" && task.friday == true
          current_tasks.push(task)
        elsif current_day == "saturday" && task.saturday == true
          current_tasks.push(task)
        elsif current_day == "sunday" && task.sunday == true
          current_tasks.push(task)
        end
      elsif task.date_schedule.strftime("%A %d %B, %Y") == Date.today.strftime("%A %d %B, %Y")
        current_tasks.push(task)
      end
    end
    return current_tasks
  end
end
