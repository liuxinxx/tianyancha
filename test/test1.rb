require 'watir'
# def download(url)
#   chrome = Watir::Browser.new(:chrome)
#   # page=  Watir::Browser.new(:phantomjs)
#   # page.close()
#   chrome.goto(url)
#   puts "开始填入登录信息！"
#   chrome.text_field(:class,"_input input_nor contactphone").set("15938918793")
#     sleep 8
#   # return  chrome
# end
url = 'https://www.tianyancha.com/login'
chrome = Watir::Browser.new(:chrome)
# page=  Watir::Browser.new(:phantomjs)
# page.close()
chrome.goto(url)
puts "开始填入登录信息！"