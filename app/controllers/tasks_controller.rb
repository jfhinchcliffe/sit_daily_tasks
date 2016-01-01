class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :description, :date_schedule, :repeats, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end

    def set_task
      @task = Task.find(params[:id])
    end

end
