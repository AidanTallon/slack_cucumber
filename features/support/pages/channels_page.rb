class ChannelsPage < Page
  attr_accessor :browser, :url

  @@url = 'https://spartaglobal.slack.com/messages/'

  def self.url
    @@url
  end

  def initialize(browser)
    super
    @url = 'https://spartaglobal.slack.com/messages/'
  end

  def visit
    @browser.goto @@url
    confirm_on_page
  end

  def logout
    #sleep 5
    confirm_on_page rescue return
    wait_until_clickable(@browser.div(id: 'team_menu'))
    wait_until_clickable(@browser.li(id: 'logout').a)
  end

  def confirm_on_page
    @browser.div(id: 'team_menu').wait_until_present(15)
  end

  def user_active?
    sleep 5
    if @browser.i(id: 'presence').class_name.match /(^| )active($| )/
      return true
    else
      return false
    end
  end

  def user_away?
    sleep 5
    if @browser.i(id: 'presence').class_name.match /(^| )away($| )/
      return true
    else
      return false
    end
  end

  def user_snoozing?
    sleep 5
    if @browser.i(id: 'presence').class_name.match /(^| )dnd($| )/
      return true
    else
      return false
    end
  end

  def set_status(status)
    #sleep 5
    # status must be :active or :away
    menu_button = @browser.div(id: 'team_menu')
    status_button = @browser.li(id: 'member_presence').a
    if status == :active
      return if user_active?
      wait_until_clickable(menu_button)
      #sleep 1
      if status_button.text.include? '[Away] Set yourself to active'
        wait_until_clickable status_button
      end
    elsif status == :away
      return if user_away?
      wait_until_clickable menu_button
      #sleep 1
      if status_button.text.include? 'Set yourself to away'
        wait_until_clickable status_button
      end
    end
  end

  def set_snooze(value)
    # value must be true or false
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
    if dialog_box?
      @browser.div(id: 'generic_dialog').button(class: 'close').click
      sleep 5
    end
  end

  def dialog_box?
    begin
      @browser.div(id: 'generic_dialog').wait_until_present(10)
      return true
    rescue
      return false
    end
  end
end