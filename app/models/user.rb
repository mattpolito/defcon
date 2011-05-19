class User < ActiveRecord::Base
  # Associations
  has_many :authentications

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
end
