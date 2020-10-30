class Admin::WordsController < ApplicationController
    before_action :only_loggedin_users, only: [:show, :index]
    before_action :admin_user
    before_action :require_admin

    def index
        @category = Category.find(params[:category_id])
        @words = @category.words.all
      end
    
    def show
    end

    def new
      @category = Category.find(params[:category_id])
      @words = @category.words.all
      #@word = Word.build.find(params[:word_id])
    end

    def edit
      @category = Category.find(params[:category_id])
      @word = @category.words.find(params[:id])
      @word = @category.words.build
    end

    def create
      @category = Category.find_by_id(params[:category_id])
      @word = @category.words.build(word_params)
        if @word.save
          redirect_to admin_categories_url
        else
          @feed_items = nil
          render 'new'
        end 
    end 
  
    def destroy
      Word.find(params[:id]).destroy
      redirect_to admin_categories_url
    end
  
    private
    def word_params
      params.require(:word).permit(:words, :category_id)
    end

    def admin_user
      redirect_to root_url unless current_user.administrator?
    end
  
    def category_params
      params.require(:category).permit(:title, :description)
    end
  

     
end
