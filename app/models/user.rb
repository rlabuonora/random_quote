class User < ActiveRecord::Base
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      # info
      user.name = auth_hash['info']['name']
      user.location = auth_hash['info']['location']
      user.image_url = auth_hash['info']['image']
      user.url = auth_hash['info']['urls']['Twitter']
      # credentials
      user.token = auth_hash['credentials']['token']
      user.secret = auth_hash['credentials']['secret']
      # save to db
      user.save!
      
      user
    end
  end
  
  def tweet(quote)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = token
      config.access_token_secret = secret
    end
    client.update(quote)
  end
end
