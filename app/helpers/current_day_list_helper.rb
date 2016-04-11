module CurrentDayListHelper

  def populate_current_tasks
    #converts day name to a downcased string
    current_day = Date.today.strftime("%A").to_s.downcase
    current_tasks = []
    #goes through every task and matches task day value
    #to current_day string. Adds to array if there's a match
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
        #matches date on task to current date and adds to array if matched
      elsif task.date_schedule.strftime("%A %d %B, %Y") == Date.today.strftime("%A %d %B, %Y")
        current_tasks.push(task)
      end
    end
    return current_tasks
  end

  def count_complete_and_incomplete_tasks(current_tasks)
    current_tasks.each do |cst|
      @cdl = @current_day_list.daily_tasks.find_or_create_by(title: cst.title, description: cst.description, complete: [true, false])
      @daily_tasks.push(@cdl)
      if @cdl.complete == true
        @complete_task_count += 1
      elsif @cdl.complete == false
        @incomplete_task_count += 1
      end
      if @incomplete_task_count == 0
        @user = current_user.email
        UserMailer.jobs_done(@user).deliver_now
      end
    end
  end

end
