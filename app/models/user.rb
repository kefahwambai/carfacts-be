class User < ApplicationRecord    
    has_secure_password
  
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
  
    enum role: { user: 0, admin: 1, service_center: 2 }
end
  