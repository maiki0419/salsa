class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = "チームの登録が完了しました。"
      redirect_to team_path(@team.id)
    else
      flash[:alert] = "チームの登録に失敗しました。"
      render :new
    end
  end

  def index
    @teams = Team.all.order(created_at: :DESC)
  end


  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def team_params
    params.require(:team).permit(:owner_id, :name, :prefecture_id, :city, :member_count, :age, :level, :activities_time, :founded, :team_image, :introduction)
  end


end
