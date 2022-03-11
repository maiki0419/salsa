class TeamsController < ApplicationController

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      current_customer.team_customers.create(team_id: @team.id)
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
    @team = Team.find(params[:id])
    @posts = Post.where(team_id: @team_id)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to team_path(@team.id)
    else
      flash[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def destroy

  end

  private

  def team_params
    params.require(:team).permit(:owner_id, :name, :prefecture_id, :city, :member_count, :age, :level, :activities_time, :founded, :team_image, :introduction)
  end


end
