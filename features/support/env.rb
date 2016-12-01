require 'watir'
require 'pry'
require 'yaml'
require 'slowhandcuke'
require './features/support/pages/page.rb' # Needs to be required before other page objects

USER_DATA = {}
YAML.load_file('./features/support/test_data/user_data.yml').each do |user|
  USER_DATA[user['email']] = user
end

def click_when_clickable(element, countdown=5)
  begin
    element.click
  rescue
    countdown -= 1
    if countdown <= 0
      raise 'Element did not become clickable.'
    else
      sleep 1
      click_when_clickable(element, countdown)
    end
  end
end
