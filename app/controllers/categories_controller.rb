class CategoriesController < ApplicationController

before_action :only_loggedin_users

def show
    @categories = Category.paginate(page: params[:page], per_page: 6)
end

def index
    @categories = Category.find(params[:title_id])
    @categories = Category.find(params[:description_id])

    @categories = Category.paginate(page: params[:page], per_page: 6)
end

end

