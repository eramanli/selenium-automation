require 'selenium-cucumber'
require 'watir'

Given(/^I navigate to (.*?)$/) do |arg|
  $driver.manage.window.maximize
  navigate_to(arg)
end

Then(/^I go back$/) do
  $driver.navigate.back
end