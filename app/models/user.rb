class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  authenticates_with_sorcery!

  # Validations
  validates :password, :confirmation => true

  # Logic

end
