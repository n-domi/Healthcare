class BadfeelingsController < ApplicationController
  def create
    @badfeeling = Badfeeling.new(user_id: @current_user.id, record_id: params[:record_id])
    @badfeeling.save
    if Goodfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
      @goodfeeling = Goodfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
      @goodfeeling.destroy
    end
    redirect_back(fallback_location: home_path)
  end

  def destroy
    @badfeeling = Badfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
    @badfeeling.destroy
    redirect_back(fallback_location: home_path)
  end
end
