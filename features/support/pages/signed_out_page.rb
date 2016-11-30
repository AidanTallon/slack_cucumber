class SignedOutPage
  attr_accessor :browser

  @@url = 'https://spartaglobal.slack.com/signout/done'

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

  def confirm_on_page
    @browser.div(id: 'page_contents').a(text: 'Sign back in').wait_until_present(15)
  end
end