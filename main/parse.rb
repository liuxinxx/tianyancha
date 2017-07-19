require '../sup'
require 'json'
require 'pp'
class Parse
  public
  def parse_html(url)
    html = dow_html(url)
    html.xpath('//div[@class="col-xs-10 search_repadding2 f18"]/a').each do |div|
      url_info = div['href']
      html_info = @dow.download_html(url_info)

      html_info.xpath('//div[@class="c8"]').each do |td|
        puts td.content
      end
    end
  end

  def initialize
    @dow = Dow.new
  end

  private
  def dow_html(url)
    @dow.download_html(url)
  end
end

pas = Parse.new
root = 'https://www.tianyancha.com/search?key='
pm = '&checkFrom=searchBox'
key = '金鼎印业'
url = root + key + pm
pas.parse_html(url)
