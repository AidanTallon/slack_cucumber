class SignedOutPage < Page
  attr_accessor :browser, :url

  def initialize(browser)
    super
    @url = 'https://spartaglobal.slack.com/signout/done'
  end

  def visit
    @browser.goto @@url
    confirm_on_page
  end

  def trait
    @browser.div(id: 'page_contents').a(text: 'Sign back in')
  end

  def confirm_on_page
    puts "Don't use me. I am signed_out_page.confirm_on_page. doink"
    Watir::Wait.until(timeout: 10) { @browser.div(id: 'page_contents').a(text: 'Sign back in').present? }
  end
end
