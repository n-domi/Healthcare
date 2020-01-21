class BadfeelingsController < ApplicationController
  def create
    @badfeeling = Badfeeling.new(user_id: @current_user.id, record_id: params[:record_id])
    @badfeeling.save
    redirect_to("/records/#{params[:record_id]}")
  end

  def destroy
    @badfeeling = Badfeeling.find_by(user_id: @current_user.id, record_id: params[:record_id])
    @badfeeling.destroy
    redirect_to("/records/#{params[:record_id]}")
  end
end
