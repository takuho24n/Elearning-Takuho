class Admin::AdminsController < ApplicationController

    before_action :only_loggedin_users, only: [:edit, :update, :destroy, :following, :followers]
    before_action :admin_user, only: [:create, :show, :edit, :destroy]
 

    def index
    end

    def new
    end

    def edit
    end

    def show
    end

    def create
    end

    def destroy
    end

    private
    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end

    def set_admin
        @admin = Admin.find(paramas[:id])

end
