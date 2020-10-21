class Admin::UsersController < ApplicationController
    before_action :only_loggedin_users
    before_action :admin_user

    def show
    end
    
    def index
        @users = User.all.order(created_at_: :DESC)
    
    end

    private
    def admin_user
        redirect_to root_url unless current_user.administrator?
    end
end
