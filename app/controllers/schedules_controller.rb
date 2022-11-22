class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.all
    @schedules = Schedule.all.order(start_day: "ASC")
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title,:start_day,:end_day,:all_day,:memo))
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      flash.now[:alert] =  "スケジュールの登録に失敗しました"
      render "new" , status: :unprocessable_entity
    end
  end
  
  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title,:start_day,:end_day,:all_day,:memo))
      flash[:notice] = "スケジュールの編集が完了しました"
      redirect_to :schedules
    else
      flash.now[:alert] = "スケジュールの編集に失敗しました"
      render "edit", status: :unprocessable_entity
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules, status: :see_other
  end
end
