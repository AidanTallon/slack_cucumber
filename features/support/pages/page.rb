class Page
  attr_accessor :browser, :url

  def initialize(browser)
    @browser = browser
  end

  def visit
    @browser.goto @url
    confirm_on_page
  end

  def confirm_on_page
    raise 'Method not defined in class'
  end
end
