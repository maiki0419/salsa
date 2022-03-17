class RelationshipsController < ApplicationController
before_action :authenticate_customer!
  def create
    current_customer.relationships.create(followed_id: params[:customer_id])
    # フォロー通知
    @customer = Customer.find(params[:customer_id])
    @customer.create_notification_follow!(current_customer)

    redirect_to request.referer
  end

  def destroy
    current_customer.relationships.find_by(followed_id: params[:customer_id]).destroy
    redirect_to request.referer
  end



end
