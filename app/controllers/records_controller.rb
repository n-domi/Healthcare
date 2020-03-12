class RecordsController < ApplicationController
  # def index
  #   @records = Record.where(user_id: @current_user.id).order(created_at: :desc).page(params[:page]).per(5)
  #   @record = Record.find_by(user_id: @current_user.id)
  # end
  
  # def show
  #   @record = Record.find_by(id: params[:id])
  #   @user = @record.user
  #   @goodfeelings_count = Goodfeeling.where(record_id: @record.id).count
  #   @badfeelings_count = Badfeeling.where(record_id: @record.id).count
  # end
  
  def new
    @record = Record.new
  end
  
  def create
    @record = Record.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @record.save
      redirect_back(fallback_location: home_path)
    else
      redirect_back(fallback_location: home_path)
    end
  end
  
  def edit
    @records = Record.where(user_id: @current_user.id).order(created_at: :desc).page(params[:page]).per(3)
    @record = Record.find_by(id: params[:id])
    
  end
  
  def update
    @record = Record.find_by(id: params[:id])
    @record.content = params[:content]
    if @record.save
      redirect_to home_path
    else
      redirect_back(fallback_location: edit_record_path(params[:id]))
    end
  end
  
  def destroy
    @record = Record.find_by(id: params[:id])
    @record.destroy
    redirect_back(fallback_location: home_path)
  end

  def home
    @record = Record.new
    @records = Record.where(user_id: @current_user.id).order(created_at: :desc).page(params[:page]).per(3)
  end

end

