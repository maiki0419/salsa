class TeamRecordsController < ApplicationController


  def create
    @team = Team.find(params[:team_id])
    @team_record = @team.team_records.new(team_record_params)
    if @team_record.save
      flash[:notice] = "成績登録に成功しました。"
      redirect_to request.referer
    else
      flash[:alert] = "成績登録に失敗しました。"
      @team_records = TeamRecord.where(team_id: @team.id)
        # 予定一覧用
      @schedules_index = Schedule.where(team_id: @team.id).page(params[:page]).per(5)
      # fullcalendar用
      @schedules = Schedule.where(team_id: @team.id)
      render template: "schedules/index"
    end
  end

  def destroy
    @team_record = TeamRecord.find_by(team_id: params[:team_id], id: params[:id])
    @team_record.destroy
    redirect_to request.referer
  end

  private

  def team_record_params
    params.require(:team_record).permit(:day, :place, :opponent, :score, :note, :result)
  end

end
