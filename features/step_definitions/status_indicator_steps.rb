Given(/^I am logged in$/) do
  sleep 5
  begin
    @channels_page.confirm_on_page
  rescue
    @login_page.visit
    @login_page.login(@user['email'], @user['password'])
    if @channels_page.user_away?
      @channels_page.close_dialog_box
      @channels_page.set_status :active
    end
  end
end

Given(/^I am on the channels page$/) do
  @channels_page.confirm_on_page
end

Given(/^I have set my status to active$/) do
  @channels_page.set_status :active
end

Then(/^my status should be active$/) do
  raise unless @channels_page.user_active?
end

Given(/^I have set my status to away$/) do
  @channels_page.set_status :away
end

Then(/^my status should be away$/) do
  raise unless @channels_page.user_away?
end

Given(/^I have set not to be disturbed$/) do
  @channels_page.set_snooze true
end

Then(/^my status should be sleeping$/) do
  raise unless @channels_page.user_snoozing?
end
