class CategoriesController < ApplicationController

before_action :only_loggedin_users

  def show
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end

  def index
    @categories = Category.all
    #@categories = Category.find(params[:description_id])

    @categories = Category.paginate(page: params[:page], per_page: 6)
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_url
  end

end

