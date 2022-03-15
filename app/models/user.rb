class User < ActiveRecord::Base

  has_secure_password
  
  validates :name, :email ,presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
   email = email.downcase.strip
   user = User.find_by(email: email)
   if user && user.authenticate(password)
    user
   else
    nil
   end

  end
end
