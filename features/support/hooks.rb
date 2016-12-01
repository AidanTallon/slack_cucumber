Before do
  @user = USER_DATA['atallon@spartaglobal.co']
end

After('@signin') do
  if App.channels_page.on_page?
    App.channels_page.logout
    raise unless App.signed_out_page.on_page?
  end
end

After('@status') do
  App.channels_page.set_snooze false
  App.channels_page.set_status :active
end
