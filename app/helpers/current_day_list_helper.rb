module CurrentDayListHelper

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
