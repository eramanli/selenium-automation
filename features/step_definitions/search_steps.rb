require 'selenium-cucumber'
require 'watir'


When(/^I search for (.*?)$/) do |arg|
  clear_text('name','search_word')
  enter_text('name',arg, 'search_word')
  if is_exist_element('id','later-subscription-button')
    click('id', 'later-subscription-button')
  end
  click('id', 'header_find_button')
  $search_keyword = arg
end


Then(/^I go to page (\d+) and select product (\d+)$/) do |arg1,arg2|
  if is_exist_element('css','.btn-alert-close')
    click('css','.btn-alert-close')
  end
  click('css',".pager>ul>li:nth-of-type(#{arg1})")
  click('css',"[itemprop='itemListElement']:nth-of-type(#{arg2})")
  if !is_exist_element('xpath','//*[@id="col-center"]/div[1]/div[1]/ul[2]/li[2]/ul/li[2]/div[3]/div[1]/strong')
    click('css',"[itemprop='itemListElement']:nth-of-type(#{arg2})")
  end
end