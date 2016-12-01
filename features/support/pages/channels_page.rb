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
    sleep 5
    close_dialog_box
    confirm_on_page rescue return
    @browser.div(id: 'team_menu').click
    @browser.li(id: 'logout').a.click
  end

  def confirm_on_page
    @browser.div(id: 'team_menu').wait_until_present(15)
  end

  def user_active?
    if @browser.i(id: 'presence').class_name.match /(^| )active($| )/
      return true
    else
      return false
    end
  end

  def user_away?
    if @browser.i(id: 'presence').class_name.match /(^| )away($| )/
      return true
    else
      return false
    end
  end

  def user_snoozing?
    if @browser.i(id: 'presence').class_name.match /(^| )dnd($| )/
      return true
    else
      return false
    end
  end

  def set_status(status)
    sleep 5
    # status must be :active or :away
    close_dialog_box
    menu_button = @browser.div(id: 'team_menu')
    status_button = @browser.li(id: 'member_presence').a
    if status == :active
        return if user_active?
        menu_button.click
        if status_button.text.include? '[Away] Set yourself to active'
          status_button.click
        end
    elsif status == :away
      return unless user_active?
      menu_button.click
      if status_button.text.include? 'Set yourself to away'
        status_button.click
      end
    end
  end

  def set_snooze(value)
    # value must be true or false
    close_dialog_box
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