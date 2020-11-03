class Admin::CategoriesController < ApplicationController
  before_action :only_loggedin_users
  before_action :admin_user
  before_action :require_admin
  
  def index # Shows all categories
    # @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 10)
    # @categories = Category.find(params[:category_id])
    # @words = @category.words.find(params[:category_id])
    # @word = Word.find(params[:word_id])

  
  end

  def show # Display 1 category
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    #@categories = Category.all
    @category = Category.find(params[:id])
   # @word = Word.find(params[:word_id])
  end
  
  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Save successfully"
        redirect_to admin_categories_url
      else
        flash[:danger] = "Invaild content. Try again"
        render 'new'
     end
  end

  def update
    @category = Category.find(params[:id])
    #@word = Word.find(params[:word_id])

    if @category.update_attributes(category_params)
      redirect_to admin_category_url
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
