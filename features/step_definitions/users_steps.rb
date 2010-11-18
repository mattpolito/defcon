Given /^I am a logged in user$/ do

  @user = Fabricate(:sequenced_user)

  steps %Q{
    Given I am not logged in
    And I go to the login page
    And I fill in "user_email" with "#{@user.email}"
    And I fill in "user_password" with "#{@user.password}"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  }
end

Given /^I am not logged in$/ do
  visit "users/sign_out"
end
