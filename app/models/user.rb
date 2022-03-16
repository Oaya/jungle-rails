class User < ActiveRecord::Base

  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

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
