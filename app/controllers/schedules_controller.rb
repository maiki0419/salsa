class SchedulesController < ApplicationController


  def index
    @team = Team.find(params[:team_id])
    @schedule = Schedule.new
    @schedules = Schedule.all
  end

  def create
    @team = Team.find(params[:team_id])
    @schedule = @team.schedules.new(schedule_params)
    if @schedule.save
      flash[:notice] = "予定登録に成功しました。"
      redirect_to request.referer
    else
      flash[:alert] = "予定登録に失敗しました。"
      render :index
    end
  end


  def destroy

  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :starts_at, :ends_at)
  end


end
