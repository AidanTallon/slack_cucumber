Given /^I am on the sign in page$/ do
  sleep 5
  App.login_page.visit
end

When /^I enter the correct credentials$/ do
  App.login_page.login @user['email'], @user['password']
end

Then /^I should be signed in$/ do
  App.channels_page.confirm_on_page
  if App.channels_page.user_away?
    App.channels_page.close_dialog_box
  end
end

Given /^I enter incorrect credentials$/ do
  App.login_page.set_remember_checkbox false
  App.login_page.set_credentials @user['email'], 'asdab as'
end

Then /^I should not be signed in$/ do
  App.login_page.confirm_on_page
end
