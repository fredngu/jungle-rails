class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: {case_sensitive: false}
  validates :name, presence: true
  validates :password, confirmation:true, length: { in: 6..20 }

  def self.authenticate_with_credentials(emailInput, passwordInput)
    user = User.find_by_email(emailInput.strip.downcase)
    if user && user.authenticate(passwordInput)
      user
    else
      nil
    end
  end

end
