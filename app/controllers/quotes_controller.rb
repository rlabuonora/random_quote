class QuotesController < ApplicationController
  def show
  end
    
  def tweet
    # tweet
    current_user.tweet(params[:quote])
    respond_to do |format|
      format.js { render "tweet" }
    end
  end
end
