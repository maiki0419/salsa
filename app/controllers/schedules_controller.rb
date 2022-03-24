class SchedulesController < ApplicationController
before_action :authenticate_customer!


  def index
    @team = Team.find(params[:team_id])
    @schedule = Schedule.new
    @team_record = TeamRecord.new
    @team_records = TeamRecord.where(team_id: @team.id)
    # 予定一覧用
    @schedules_index = Schedule.where(team_id: @team.id).page(params[:page]).per(5)
    # fullcalendar用
    @schedules = Schedule.where(team_id: @team.id)
  end

  def create
    @team = Team.find(params[:team_id])
    @schedule = @team.schedules.new(schedule_params)
    if @schedule.save
      flash[:notice] = "予定登録に成功しました。"
      redirect_to request.referer
    else
      flash[:alert] = "予定登録に失敗しました。"
      @team_records = TeamRecord.where(team_id: @team.id)
      @schedules_index = Schedule.where(team_id: @team.id).page(params[:page]).per(5)
      render :index
    end
  end


  def destroy
    @schedule = Schedule.find_by(team_id: params[:team_id], id: params[:id])
    @schedule.destroy
    redirect_to request.referer
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :starts_at, :ends_at)
  end



end
