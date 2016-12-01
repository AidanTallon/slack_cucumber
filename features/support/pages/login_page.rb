class LoginPage < Page
  attr_accessor :browser, :url

  def initialize(browser)
    super
    @url = 'https://spartaglobal.slack.com/'
  end

  def confirm_on_page
    @browser.button(id: 'signin_btn').wait_until_present(15)
    @browser.h1(id: 'signin_header').span(text: 'spartaglobal.slack.com').wait_until_present(15)
  end

  def login(email, password, remember_me = false)
    # Log in as user
    set_remember_checkbox remember_me
    set_credentials email, password
  end

  def set_credentials(email, password)
    # Set email and password and press enter
    # Should be called after set_remember checkbox when logging in
    @browser.text_field(id: 'email').set email
    @browser.text_field(id: 'password').set "#{password}\n"
  end

  def set_remember_checkbox(value)
    # Sets remember checkbox
    # Value should be bool
    # Should be called before set_credentials
    checkbox = @browser.form(id: 'signin_form').input(name: 'remember')
    # If checkbox is not equal to value, click it
    checkbox.click unless checkbox.checked? == value
  end
end
