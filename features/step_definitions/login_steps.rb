When /^I fill in the login form with:$/ do |table|
  table.rows_hash.each do |input, value|
    page.fill_in input, :with => value
  end
end

Then /^password field does not show typed value$/ do
  page.find("//*[@id='password']")[:type].should == 'password'
end
