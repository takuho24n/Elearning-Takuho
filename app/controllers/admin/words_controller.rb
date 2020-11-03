class Admin::WordsController < ApplicationController
    before_action :only_loggedin_users
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
      #@words = @category.words.build
      @words = @category.words.new
      #@word = Word.build.find(params[:word_id])
    end

    def edit
      @category = Category.find(params[:category_id])
      @word = @category.words.find(params[:id])
      #@word = @category.words.build
    end

    def update
      @category = Category.find(params[:category_id])
      @word = @category.words.find(params[:id])
  
      if @word.update_attributes(word_params)
        redirect_to admin_category_url(@category)
      else
        redirect_to admin_category_word_url(@category)
      end
    end

    def create
      @category = Category.find_by_id(params[:category_id])
      @word = @category.words.new(word_params)
        if @word.save
          redirect_to new_admin_category_word_url
        else
          #@feed_items = nil
          render 'new'
        end 
    end 
  
    def destroy
      Word.find(params[:id]).destroy
      redirect_to admin_category_words_url
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
