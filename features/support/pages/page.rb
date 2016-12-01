class Page
  attr_accessor :browser, :url

  def initialize(browser)
    raise 'Page should not be instantiated' if self.class == Page
    @browser = browser
  end

  def visit
    @browser.goto @url
    raise unless on_page?
  end

  def on_page?
    begin
      Watir::Wait.until { trait.present? }
      return true
    rescue
      return false
    end
  end
end
