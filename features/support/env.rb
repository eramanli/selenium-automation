require 'rubygems'
require 'selenium-cucumber'
require 'pry'

$browser_type = ENV['BROWSER'] || 'ff'
$platform = ENV['PLATFORM'] || 'desktop'
$os_version = ENV['OS_VERSION']
$device_name = ENV['DEVICE_NAME']
$udid = ENV['UDID']
$app_path = ENV['APP_PATH']

begin
  $driver = Selenium::WebDriver.for(:chrome)
  $driver.manage().window().maximize()
rescue Exception => e
  puts e.message
  Process.exit(0)
end
