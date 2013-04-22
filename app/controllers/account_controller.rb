class AccountController < ApplicationController
 def login
    if @current_user
      redirect_to root_path
    end
    if request.post?  
         user = User.try_to_login(params[:user][:user_num],params[:user][:password])
         if user  
             flash[:success] = "login successfully!" 
             session[:user_num] = params[:user][:user_num] 
  
         else
            flash[:alert] = "Your Email or password is wrong"
         end       
    end   
  end

  def logout
    logout_user
    redirect_to root_path
  end

  def register
    if request.post?
      @user = User.new(params[:user])
      @user.user_num = "3"
      if @user.save
        flash[:success] = "successfully register!"
      else
        flash[:alert] = "fail register!"
      end
    else
      @user = User.new
    end
  end
end
