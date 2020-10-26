class Admin::CategoriesController < ApplicationController

  before_action :only_loggedin_users
  before_action :admin_user
  
  def index
    @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
    @categories = Category.paginate(page: params[:page], per_page: 10)
    #@categories = Category.find(params[:id])
  end

  def new
    @categories = Category.new
  end

  def edit
    #@categories = Category.all
    @category = Category.find(params[:id])
  end
  
  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_url
      else
        render 'new'
     end
  end

  def update
    @category = Category.find_by(id: params[:id])

    if @category.update_attributes(category_params)
      redirect_to admin_categories_url
    else
      render 'edit'
    end

  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_url
  end

  private
  def admin_user
    redirect_to root_url unless current_user.administrator?
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end

end
