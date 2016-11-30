Given(/^I am logged in$/) do
  user = @user
  user.login
end

Given(/^I am on the channels page$/) do
  user = @user
  user.browser.goto 'https://spartaglobal.slack.com/messages' unless user.url.include? 'https://spartaglobal.slack.com/messages'
end

Given(/^I have set my status to active$/) do
  pending
end

Then(/^my status circle should be green$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my status should be active$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I have set my status to away$/) do
  user.browser.div(id: 'team_menu').click
  user.browser.li(id: 'member_presence').a.click
end

Then(/^my status circle should be transparent$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my status should be away$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I have set not to be disturbed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my status circle should be green and sleeping$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my status circle should be transparent and sleeping$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
