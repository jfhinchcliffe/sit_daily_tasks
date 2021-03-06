class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render edit_path(@task)
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def done
    done_task = params[:done_task].to_i
    completed_task = DailyTask.find(done_task)
    completed_task.update(complete: true)
    redirect_to root_path
  end

  def reset_task
    done_task = params[:reset_task].to_i
    completed_task = DailyTask.find(done_task)
    completed_task.update(complete: false)
    redirect_to root_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :date_schedule, :repeats, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end

    def set_task
      @task = Task.find(params[:id])
    end

end
