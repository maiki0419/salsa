class TeamsController < ApplicationController
before_action :authenticate_customer!, except: [:index]
before_action :correct_customer, only: [:edit, :update]

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
    @teams = Team.all.order(created_at: :DESC).page(params[:page]).per(10)
  end


  def show
    if params[:ground].blank? || params[:member].blank?
      @ground_price = ""
    else
      @ground_price = params[:ground].to_i / params[:member].to_i
    end
    @team = Team.find(params[:id])
    @posts = Post.where(team_id: @team.id).order(created_at: "DESC").page(params[:page]).per(10)
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
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to customer_path(current_customer)
  end

  private

  def team_params
    params.require(:team).permit(:owner_id, :name, :prefecture_id, :city, :member_count, :age, :level, :activities_time, :founded, :team_image, :introduction)
  end

  def correct_customer
    @team =Team.find(params[:id])
    if @team.owner_id != current_customer.id
      redirect_to team_path(@team.id)
    end
  end

end
