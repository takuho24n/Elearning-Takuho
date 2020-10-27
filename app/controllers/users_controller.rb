class UsersController < ApplicationController
  # before EDIT & UPDATE, check only logged in users -> only logged in users can edit and update
  before_action :only_loggedin_users, only: [:edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def index
    # @users = User.all
    # Index with Will_Paginate
    # @variable = Model.paginate(page: params[current_page], per_page: # of items displayed)
    @users = User.paginate(page: params[:page], per_page: 10)

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_url
    else 
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user.update_attributes(user_params) 
      redirect_to @user
    else
      render 'edit'
    end # end of if else
  end # end of update

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 10)
    @all_users = @user.followed_users

    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: 10)
    @all_users = @user.followers

    render 'show_follow'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      # 1. Check the user ID in order to check who is online right now
      # 2. Go to Home page IF it's not current user
      redirect_to root_url unless current_user?(@user)
    end
    
end
