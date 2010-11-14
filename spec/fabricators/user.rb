Fabricator(:user) do 
  email {Fabricate.sequence(:email) {|i| "user#{i}@example.com"}}
  password "secret"
  password_confirmation {|user| user.password}
end
