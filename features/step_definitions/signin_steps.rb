Given /^I am on the sign in page$/ do
  sleep 5
  @login_page.visit
end

When /^I enter the correct credentials$/ do
  @login_page.login(@user['email'], @user['password'])
end

Then /^I should be signed in$/ do
  @channels_page.confirm_on_page
end

Given /^I enter incorrect credentials$/ do
  @login_page.set_remember_checkbox false
  @login_page.set_credentials @user['email'], 'asdab as'
end

Then /^I should not be signed in$/ do
  @login_page.confirm_on_page
end
