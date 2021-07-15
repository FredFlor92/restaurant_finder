class User < ApplicationRecord
    has_secure_password 
    has_many :reviews
    has_many :reviewed_restaurants, through: :reviews, source: :restaurant 

    has_many :restaurants   

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true 

    # def self.create_by_github_omniauth(auth)
    #     self.find_or_create_by(username: auth[:info][:email]) do |u|
    #       u.email = auth[:info][:email]  
    #       u.password = SecureRandom.hex
    
    #     end
    # end
end
