class Admin::CategoriesController < ApplicationController

  before_action :only_loggedin_users
  before_action :admin_user

  def show
    @categories = Category.paginate(page: params[:page], per_page: 10)
    @categories = Category.find(params[:id])
  end
    
  def index
    @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @categories = Category.new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to  'admin/categories/index'
     else
       render 'admin/categories/new'
     end
  end

  def edit
    #@categories = Category.all
    @categories = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      redirect_to 'index'
    else
      render 'admin/categoris/edit'
    end

  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_url
  end

  private
  def admin_user
    redirect_to root_url unless current_user.administrator?
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end

end
