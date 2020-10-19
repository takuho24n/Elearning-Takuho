class PagesController < ApplicationController
  
  def home
    
    if logged_in?
      @user = current_user
    else admin_user?
      @user = admin_user
    end      
  
  end 
end
