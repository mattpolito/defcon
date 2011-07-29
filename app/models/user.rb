class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Associations
  has_many :authentications
  has_many :account_memberships
  has_many :accounts, :through => :account_memberships

  # Logic
  def self.create_with_omniauth(auth)
    transaction do
      user = create!
      user.authentications.create! do |authentication|
        authentication.provider = auth["provider"]
        authentication.uid      = auth["uid"]
      end
    end
  end

  def self.find_for_authentication(conditions={})
    conditions[:accounts] = { :subdomain => conditions.delete(:subdomain) }
    where(conditions).joins(:accounts).readonly(false).first
  end

  def account_subdomains
    accounts.map(&:subdomain)
  end

  def has_account_access_for?(subdomain)
    account_subdomains.include?(account.subdomain)
  end
end
