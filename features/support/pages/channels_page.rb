class ChannelsPage
  attr_accessor :browser

  @@url = 'https://spartaglobal.slack.com/messages/'

  def self.url
    @@url
  end

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto @@url
    confirm_on_page
  end

  def logout
    confirm_on_page rescue return
    @browser.div(id: 'team_menu').click
    @browser.li(id: 'logout').a.click
  end

  def confirm_on_page
    @browser.div(id: 'team_menu').wait_until_present(15)
  end

  def user_active?

  end

  def user_away?

  end

  def user_snoozing?

  end

  def set_status(status)
    # status must be :active or :away
    menu_button = @browser.div(id: 'team_menu')
    status_button = @browser.li(id: 'member_presence').a
    if status == :active
        menu_button.click
        if status_button.include? 'active'
          status_button.click
        end
    elsif status == :away
      menu_button.click
      if status_button.include? 'away'
        status_button.click
      end
    end
  end

  def set_snooze(value, duration=20)

  end
end