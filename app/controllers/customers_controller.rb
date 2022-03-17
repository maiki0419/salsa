class CustomersController < ApplicationController
  before_action :correct_customer, only: [:edit, :update]

  def show
    @customer = Customer.find(params[:id])
    @team_customers = @customer.team_customers
    @posts = @customer.favorite_posts
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to customer_path(@customer.id)
    else
      flash[:alert] = "更新に失敗しました。"
      render :edit
    end
  end


  def followers
    @customer = Customer.find(params[:id])
    @followers = @customer.followers
  end

  def followeds
    @customer = Customer.find(params[:id])
    @followeds = @customer.followeds
  end


  private

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image, :prefecture_id, :city, :gender_id, :age, :introduction)
  end
  
  def correct_customer
    @customer = Customer.find(params[:id])
    if @customer != current_customer
      redirect_to customer_path(current_customer)
    end
  end

end
