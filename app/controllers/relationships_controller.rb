class RelationshipsController < ApplicationController

  def create
    current_customer.relationships.create(followed_id: params[:customer_id])
    # フォロー通知
    @customer = Customer.find(params[:customer_id])
    @customer.create_notification_follow!(current_customer)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.relationships.find_by(followed_id: params[:customer_id]).destroy
  end



end
