class User < ApplicationRecord

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email']
        if auth['credentials']
          user.token = auth['credentials']['token']
          user.secret = auth['credentials']['secret']
          user.save
        end
      else
        puts "hello"
      end
    end
  end
end
