Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "([^"]*)"$/ do |button_text|
  click_button(button_text)
end

When /^I submit "([^"]*)" form by pressing "([^"]*)"$/ do |form_name, button_text|
  within("//form[@id='#{form_name}']") do
    click_button(button_text)
  end
end

Then /^I am redirected to (.+)$/ do

end
