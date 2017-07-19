require 'watir'
def download(url)
  # page = Watir::Browser.new(:chrome)
  page=  Watir::Browser.new(:phantomjs)
  page.goto(url)
  # page.close()
  return  page
end
html = download('https://www.tianyancha.com/login')
puts html.title