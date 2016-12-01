# Slack messages page where you can see channels
class ChannelsPage < Page
  attr_accessor :browser, :url

  def initialize(browser)
    super
    @url = 'https://spartaglobal.slack.com/messages/'
  end

  def trait
    # Trait unique to page
    @browser.div(id: 'team_menu')
  end

  def logout
    # Check if on channel page and log out
    if on_page?
      wait_until_clickable(@browser.div(id: 'team_menu'))
      wait_until_clickable(@browser.li(id: 'logout').a)
    end
  end

  def user_active?
    # Returns true if user state is active
    # TODO: Alternative to sleep
    sleep 5
    if @browser.i(id: 'presence').class_name.match /(^| )active($| )/
      return true
    else
      return false
    end
  end

  def user_away?
    # Returns false if user state is away
    # TODO: Alternative to sleep
    sleep 5
    if @browser.i(id: 'presence').class_name.match /(^| )away($| )/
      return true
    else
      return false
    end
  end

  def user_snoozing?
    # Returns false if user is set to 'don't disturb'
    # TODO: Alternative to sleep
    sleep 5
    if @browser.i(id: 'presence').class_name.match /(^| )dnd($| )/
      return true
    else
      return false
    end
  end

  def set_status(status)
    # status must be :active or :away
    # Sets user status
    menu_button = @browser.div(id: 'team_menu')
    status_button = @browser.li(id: 'member_presence').a
    if status == :active
      return if user_active?
      wait_until_clickable(menu_button)
      if status_button.text.include? '[Away] Set yourself to active'
        wait_until_clickable status_button
      end
    elsif status == :away
      return if user_away?
      wait_until_clickable menu_button
      if status_button.text.include? 'Set yourself to away'
        wait_until_clickable status_button
      end
    end
  end

  def set_snooze(value)
    # value must be true or false
    # Sets whether user is accepting notifications
    if value
      unless user_snoozing?
        @browser.div(id: 'ts_tip_float_floater').click
        @browser.ul(id: 'menu_items').a.click
      end
    else
      if user_snoozing?
        @browser.div(id: 'ts_tip_float_floater').click
        @browser.ul(id: 'menu_items').a.click
      end
    end
  end

  def close_dialog_box
    # Checks for generic_dialog box and closes it
    if dialog_box?
      @browser.div(id: 'generic_dialog').button(class: 'close').click
      sleep 5
    end
  end

  def dialog_box?
    # Checks for generic_dialog box
    begin
      Watir::Wait.until(timeout: 10) { @browser.div(id: 'generic_dialog').present? }
      return true
    rescue
      return false
    end
  end
end