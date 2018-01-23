class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 2 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    @user = User.where('lower(email) = ?', email.downcase).first
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end


end
