# Slack page that is displayed on logout
class SignedOutPage < Page
  attr_accessor :browser, :url

  def initialize(browser)
    super
    @url = 'https://spartaglobal.slack.com/signout/done'
  end

  def trait
    # Trait unique to page
    @browser.div(id: 'page_contents').a(text: 'Sign back in')
  end
end
