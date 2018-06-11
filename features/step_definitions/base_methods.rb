# WAIT instance for explicit wait
WAIT = Selenium::WebDriver::Wait.new(:timeout => 30)

def enter_text(access_type, text, access_name)
  WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }.send_keys text
end
def clear_text(access_type, access_name)
  WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }.clear
end
def click(access_type, access_name)
  WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }.click
end
def is_element_displayed(access_type, access_name)
  WAIT.until{ $driver.find_element(:"#{access_type}" => "#{access_name}") }.displayed?
end

def wait_for_element_to_display(access_type, access_name, duration)
  wait = Selenium::WebDriver::Wait.new(:timeout => duration.to_i) # seconds
  wait.until { $driver.find_element(:"#{access_type}" => "#{access_name}").displayed? }
end

def maximize_browser
  $driver.manage.window.maximize
end

def scroll_to_element(access_type, access_name)
  ele_scroll = WAIT.until {$driver.find_element(:"#{access_type}" => "#{access_name}")}
  ele_scroll.location_once_scrolled_into_view
end

def is_exist_element(access_type, access_name)
  begin
  wait_for_element_to_display(access_type, access_name,5)
    return true
  rescue
      return false
  end
end
def get_element_text(access_type, access_name)
  WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }.text
end
def get_element_value(access_type, access_name)
  WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }.value
end

def select_option_from_dropdown(access_type, by, option, access_name)
  dropdown = WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }
  select_list = Selenium::WebDriver::Support::Select.new(dropdown)
  select_list.select_by(:"#{by}", "#{option}")
end

def get_elements(access_type, access_name)
  WAIT.until { $driver.find_element(:"#{access_type}" => "#{access_name}") }
end

