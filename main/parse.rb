#encoding = utf-8
require '../sup'
require 'json'
class Parse
  public
  def initialize
    @dow = Dow.new
  end
  
  def parse_html(url,key)
    html = dow_html(url)

    html.xpath('//div[@class="col-xs-10 search_repadding2 f18"]/a').each do |div|
      print div.content
      txt = div.content.gsub!(/\n|\s/,"")
      if key == txt
        url_details  = div['href']
        parse_details(url_details)
        break
      else
        print "没有找到！"
      end
    end
  end

  def parse_details(url_details)
      html_info = @dow.download_html(url_details)
      html_info.xpath('//td').each do |td|
        puts td.content
      end
  end

  private
  def dow_html(url)
    @dow.download_html(url)
  end
end

pas = Parse.new
root = 'https://www.tianyancha.com/search?key='
pm = '&checkFrom=searchBox'

key = '爱尔眼科医院集团股份有限公司'
url = root + key + pm
pas.parse_html(url,key)
