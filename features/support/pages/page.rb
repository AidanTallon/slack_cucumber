# This class is purely for inheritance purposes. Do not attempt to instantiate.
class Page
  attr_accessor :browser, :url

  def initialize(browser)
    raise 'Page should not be instantiated' if self.class == Page
    @browser = browser
  end

  def visit
    # Visit page url
    # Url is assigned in initialize of subclass
    @browser.goto @url
    raise unless on_page?
  end

  def on_page?
    # Return true if on page
    # trait is a method of the subclass containing a browser element unique to that page
    begin
      Watir::Wait.until { trait.present? }
      return true
    rescue
      return false
    end
  end
end
