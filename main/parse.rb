#encoding = utf-8
require '../sup'
require 'json'
require 'pp'
class Parse
  public
  def initialize
    @dow = Dow.new
  end
  
  def login_yes?(html)
  	flog = 0
    html.xpath('//div[@class="c-white b-c9 pt8 f18 text-center login_btn"]').each do |div|
      flog =1
    end
    flog == 1? true:false 
  end

  def parse_html(url,key)
    html = dow_html(url)
    if login_yes?(html)
      puts "天眼查开始限制查询！需要登录！"
    else
      html.xpath('//div[@class="col-xs-10 search_repadding2 f18"]/a').each do |div|
        
        txt = div.content.gsub("\n","").gsub(" ","")
        puts txt,key
        if key == txt
          url_details  = div['href']
          puts "url-->#{url_details}"
          parse_details(url_details)
          break
        else
          puts "没有找到！"
        end
      end
    end
  end

  def parse_details(url_details)
    html_info = @dow.download_html(url_details)
    html_info.xpath('//div[@class="row b-c-white base2017"]').each do |td|
      print td.content.gsub(" ","")
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
key = "爱尔眼科医院集团股份有限公司"
url = root + key + pm
pas.parse_html(url,key)

