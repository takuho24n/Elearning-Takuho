class CategoriesController < ApplicationController
  before_action :only_loggedin_users

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
    #@words = @category.words.find(params[:word_id])
  end

end

