class RelationshipsController < ApplicationController

  def create
    current_customer.relationships.create(followed_id: params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.relationships.find_by(followed_id: params[:customer_id]).destroy
    redirect_to request.referer
  end

  

end
