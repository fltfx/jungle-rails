class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 4}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    #check if user exists by checking email address
    email = email.strip
    #old check that did not include case sensitive: checkUser = User.find_by_email(email)
    checkUser = User.find_by('email ILIKE ?',email)

    if checkUser && checkUser.authenticate(password)
      return checkUser
    else
      return nil
    end
  end

end