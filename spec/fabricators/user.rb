Fabricator(:sequenced_user, :from => :user) do 
  email {Fabricate.sequence(:email) {|i| "user#{i}@example.com"}}
  password "secret"
  password_confirmation {|user| user.password}
end

Fabricator(:user) do 
  email "user@example.com"
  password "secret"
  password_confirmation "secret"
end
