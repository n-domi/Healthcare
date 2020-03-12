class GoodfeelingsController < ApplicationController
  def create
    @goodfeeling = Goodfeeling.new(user_id: @current_user.id, record_id: params[:record_id])
    @goodfeeling.save
    if Badfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
      @badfeeling = Badfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
      @badfeeling.destroy
    end
    redirect_back(fallback_location: home_path)
  end

  def destroy
    @goodfeeling = Goodfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
    @goodfeeling.destroy
    redirect_back(fallback_location: home_path)
  end
end
