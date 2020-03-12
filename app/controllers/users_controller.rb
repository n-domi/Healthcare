class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/home")
    else
      render("/signup")
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    if @user.save
      redirect_back(fallback_location: home_path)
    end  
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to("/home")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to root_path
  end
  
  def goodfeelings
    @user=User.find_by(id: params[:id])
    @goodfeelings=Goodfeeling.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(4)
  end

  def badfeelings
    @user=User.find_by(id: params[:id])
    @badfeelings=Badfeeling.where(user_id: @user.id).order(created_at: :desc).page(params[:page]).per(4)
  end
end
