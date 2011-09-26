Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I press "([^"]*)"$/ do |button_text|
  click_button(button_text)
end

When /^I submit the "([^"]*)" form by pressing "([^"]*)"$/ do |form_id, button_text|
  within("//form[@id='#{form_id}']") do
    click_button(button_text)
  end
end

Then /^I see "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Then /^I do not see "([^"]*)"$/ do |content|
  page.should_not have_content(content)
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  current_path.should == path_to(page_name)
end
