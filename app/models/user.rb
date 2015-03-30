class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end

  def self.set_user(auth)
    User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.from_omniauth(auth)
  end

end