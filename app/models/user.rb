class User < ActiveRecord::Base

  has_secure_password

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 2 }
 

  def self.authenticate_with_credentials(email, password)
    user=User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end


end
