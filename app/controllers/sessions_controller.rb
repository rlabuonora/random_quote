class SessionsController < ApplicationController
  def create
    #render text: request.env['omniauth.auth'].to_yaml
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
    rescue
      flash['danger'] =  "There was an error during twitter login"
    end
    redirect_to root_path
  end
  
  def destroy
    if current_user
      session[:user_id] = nil
    end
    redirect_to root_path
  end
end