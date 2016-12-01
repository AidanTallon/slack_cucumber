# App class. Is a singleton class that creates instances of page objects as needed.
class App
  attr_reader :browser

  @@browser = Watir::Browser.new :chrome

  def self.method_missing(method_name, *arguments, &block)
    # Initializes App.page_object if it doesn't already exist
    @@pages ||= {}
    class_name = method_name.to_s.split('_').collect(&:capitalize).join
    @@pages[method_name] || @@pages[method_name] = Object.const_get(class_name).new(@@browser)
  end

  def self.close!
    # Closes the browser
    @@browser.quit
  end

  def self.flush!
    # Flushes all page object instances from App class
    @@pages = {}
  end

  private_class_method :new
end
