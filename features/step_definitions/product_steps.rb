require 'selenium-cucumber'
require 'watir'


And(/^I save price of product$/) do
  # save price and productId on product page
  $price = get_element_text('xpath','//*[@id="col-center"]/div[1]/div[1]/ul[2]/li[2]/ul/li[2]/div[3]/div[1]/strong')
  $productId = get_element_value('id','productId')
  puts $price
  puts $productId
  # create Hash to storing search keyword and product ID. we will use search keyword to delete a specific product.
  $products.store($search_keyword,$productId)
  puts $products
end

And(/^I add to chart with (.*?) fixpack$/) do |arg|
  #prod datas are not stable. Some products have dropdown menu. If statement handled this situation.
  if is_exist_element('css','.retail-select')
    select_option_from_dropdown('css','index','1','.retail-select')
  end
  click('id','add-to-basket')
  wait(2)
  if arg=='no'
    click('id','ContinueToBasket')
  else
    click('id','AddInsurance')
  end
end

Then(/^I check price of product$/) do
  $prices_in_basket << get_element_text('xpath','//*[@class="total-price"]')
  puts $prices_in_basket
  $prices_in_basket.include? $price
end


When(/^I check total price of products in basket$/) do
  # this step obtains sum of all products in the basket and compares them with cart total price.
  sum = 0
  $prices_in_basket.each{|price| f_price = price.delete(' TL').chomp.to_f
  puts f_price
  sum+=f_price
  }
  sum_of_products = sum
  puts sum_of_products
  cart_total_price = get_element_text('class','new-price').delete(' TL').chomp.to_f
  puts sum_of_products.round(3)
  puts cart_total_price.round(3)
  expect(sum_of_products.round(3)).to eq(cart_total_price.round(3))
end
