Before do
  # workaround to have a before ALL hook
  # TODO: Nicer way of before all hook
  if BEFORE_ALL_HACK
    STDOUT.write "Setting default state of user. Should only happen at start of tests.\n"
    STDOUT.write "...\n"
    @user = USER_DATA['atallon@spartaglobal.co']
    # Login and set user status to active, then logout
    App.login_page.visit
    App.login_page.login @user['email'], @user['password']
    App.channels_page.close_dialog_box
    App.channels_page.set_status :active
    App.channels_page.logout
    raise unless App.signed_out_page.on_page?
    BEFORE_ALL_HACK = false
    STDOUT.write "Done.\n"
  end
  # Before each hook
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
