class GoodfeelingsController < ApplicationController
  def create
    @goodfeeling = Goodfeeling.new(user_id: @current_user.id, record_id: params[:record_id])
    @goodfeeling.save
    redirect_to("/records/#{params[:record_id]}")
  end

  def destroy
    @goodfeeling = Goodfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
    @goodfeeling.destroy
    redirect_to("/records/#{params[:record_id]}")
  end
end
