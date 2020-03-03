class RecordsController < ApplicationController
  def index
    @records = Record.where(user_id: @current_user.id).order(created_at: :desc).page(params[:page]).per(5)
    @record = Record.find_by(user_id: @current_user.id)
  end
  
  def show
    @record = Record.find_by(id: params[:id])
    @user = @record.user
    @goodfeelings_count = Goodfeeling.where(record_id: @record.id).count
    @badfeelings_count = Badfeeling.where(record_id: @record.id).count
  end
  
  def new
    @record = Record.new
  end
  
  def create
    @record = Record.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @record.save
      redirect_to("/records/index")
    else
      render("records/new")
    end
  end
  
  def edit
    @record = Record.find_by(id: params[:id])
  end
  
  def update
    @record = Record.find_by(id: params[:id])
    @record.content = params[:content]
    if @record.save
      redirect_to("/records/index")
    else
      render("records/edit")
    end
  end
  
  def destroy
    @record = Record.find_by(id: params[:id])
    @record.destroy
    redirect_to("/records/index")
  end

end

