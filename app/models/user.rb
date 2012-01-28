class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  authenticates_with_sorcery!

  attr_accessor :password
  before_save :encrypt_password

  # Validations
  validates :password, :confirmation => true
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  # Logic
  # def self.authenticate(email, password)
  #     user = find_by_email(email)
  #     if user && user.crypted_password == BCrypt::Engine.hash_secret(password, user.salt)
  #       user
  #     else
  #       nil
  #     end
  #   end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.crypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end
  

end
