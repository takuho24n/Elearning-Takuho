class Admin::CategoriesController < ApplicationController

    before_action :only_loggedin_users
    before_action :admin_user

    def show
        @categories = Category.paginate(page: params[:page], per_page: 6)
        @categories = Category.find(params[:id])
    end
    
    def index
        @categories = Category.all
        @categories = Category.paginate(page: params[:page], per_page: 6)
    end

    def edit
    end

    private
    def admin_user
        redirect_to root_url unless current_user.administrator?
    end

end
