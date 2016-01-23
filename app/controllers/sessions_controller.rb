class SessionsController < ApplicationController
  def create
    #render text: request.env['omniauth.auth'].to_yaml
    begin
      
      @user = User.from_omniauth(request.env['omniauth.auth'])

      puts "here!"
      puts @user
      session[:user_id] = @user.id
      flash['success'] = "Welcome #{@user.name}!"
    rescue
      flash['danger'] =  "There was an error during twitter login"
    end
    redirect_to root_path
  end
  
  def destroy
    if current_user
      session[:user_id] = nil
      flash[:success] = 'Chau!'
    end
    redirect_to root_path
    
  end
end