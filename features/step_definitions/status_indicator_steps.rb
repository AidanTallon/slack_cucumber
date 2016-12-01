Given(/^I am logged in$/) do
  sleep 5
  begin
    App.channels_page.confirm_on_page
  rescue
    App.login_page.visit
    App.login_page.login(@user['email'], @user['password'])
    if App.channels_page.user_away?
      App.channels_page.close_dialog_box
      App.channels_page.set_status :active
    end
  end
end

Given(/^I am on the channels page$/) do
  App.channels_page.confirm_on_page
end

Given(/^I have set my status to active$/) do
  App.channels_page.set_status :active
end

Then(/^my status should be active$/) do
  raise unless App.channels_page.user_active?
end

Given(/^I have set my status to away$/) do
  App.channels_page.set_status :away
end

Then(/^my status should be away$/) do
  raise unless App.channels_page.user_away?
end

Given(/^I have set not to be disturbed$/) do
  App.channels_page.set_snooze true
end

Then(/^my status should be sleeping$/) do
  raise unless App.channels_page.user_snoozing?
end
