class PagesController < ApplicationController
<<<<<<< HEAD
  def home
        
=======
  
  def home
    
    if logged_in?
      @user = current_user
    end      
  
>>>>>>> ac14bf6... Third Commit_login
  end 
end
