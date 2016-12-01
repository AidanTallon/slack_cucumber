Before('@signin') do
  @user = USER_DATA['atallon@spartaglobal.co']
end

After('@signin') do
  App.channels_page.logout
end

Before('@status') do
  @user = USER_DATA['atallon@spartaglobal.co']
end

After('@status') do
  App.channels_page.set_snooze false
  App.channels_page.set_status :active
end
