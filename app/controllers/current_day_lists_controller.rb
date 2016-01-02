class CurrentDayListsController < ApplicationController
  before_action :set_current_day_list, only: [:show]
  before_action :authenticate_user!

  def index
    @current_day_lists = CurrentDayList.all
  end

  def show
    @daily_tasks = @current_day_list.daily_tasks.all
  end

  private

    def set_current_day_list
      @current_day_list = CurrentDayList.find(params[:id])
    end

end
