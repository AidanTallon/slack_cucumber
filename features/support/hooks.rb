browser = Watir::Browser.new :chrome

Before ('@signin') do
  @user = USER_DATA['atallon@spartaglobal.co']
  @browser = browser
  @login_page = LoginPage.new browser
  @channels_page = ChannelsPage.new browser
  @signed_out_page = ChannelsPage.new browser
end

After('@signin') do
  @channels_page.logout
end

Before ('@status') do
  @user = USER_DATA['atallon@spartaglobal.co']
  @browser = browser
  @login_page = LoginPage.new browser
  @channels_page = ChannelsPage.new browser
end

After ('@status') do
  @channels_page.set_snooze false
  @channels_page.set_status :active
end

