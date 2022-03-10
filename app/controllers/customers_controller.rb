class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @customer_teams = @customer.team_customers
  end

  def edit

  end

  def update

  end

end
