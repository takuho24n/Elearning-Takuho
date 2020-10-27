class CategoriesController < ApplicationController
  before_action :only_loggedin_users

  def index
    # @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

end

