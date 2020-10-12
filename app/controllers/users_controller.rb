class UsersController < ApplicationController
  def new

    @user = User.new

  end

  def create
  
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end

  end

  def show
  
    @user = User.find(params[:id])

  end

  def edit

    @user = User.find(params[:id])
    
  end

  def update
  
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end

  def destroy
  
    User.find(params[:id]).destroy
    redirect_to  users_url

  end

  end

  before_action :only_loggedin_users,
  only: [:index, :edit, :update]

  def index
  
    @users = User.paginate(page: params[:page], per_page: 10)
  
  end


  private
  def user_params
  
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end

  def only_loggedin_users

    redirect_to login_url unless logged_in?
    
  end

  def correct_user

    @user = User.find(params[:id])

    redirect_to(root_url) unless
    current_user?(@user)

  end
  

end
