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

  def new
    @category = Category.new
  end

  def edit
    #@categories = Category.all
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to  admin_categories_url(@category)
     else
       render 'new'
     end
  end


  def update
    @category = Category.find_by(params[:id])
      if @category.update_attributes(category_params)
        redirect_to 'index'
      else
        render admin_category_url
      end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

end

