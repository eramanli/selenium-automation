require 'selenium-cucumber'
require 'watir'


Then(/^I delete (.*?)$/) do |arg|
  # $products is a hash which stored on 'I save price of product' step.
  $products.select{|key,value| if key==arg
                                 puts "key: #{key} and value: #{value}"
                                 is_element_displayed('css',".row>a[data-id='#{value}']")
                                 click('css',".row>a[data-id='#{value}']")
                                 wait(2)
                               end
  }
  # after delete operation, we should update list of product's price in basket.
  $prices_in_basket=[]
  $prices_in_basket << get_element_text('xpath','//*[@class="total-price"]')
end

And(/^I clear all products in basket$/) do
  # we get all 'Sil' elements and click whole elements.
  all_delete = []
  all_delete << get_elements('css','.row>[title="Sil"]')
  all_delete.each{|delete|
    delete.click
  }
  wait(3)
end