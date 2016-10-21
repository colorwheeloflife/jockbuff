# class User < ActiveRecord::Base
#   has_secure_password
#   has_many :reviews

#   before_save { self.email = email.downcase.strip }


# end

class User < ApplicationRecord

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
