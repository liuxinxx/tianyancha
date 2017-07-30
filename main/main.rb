#encoding = utf-8
require '../support'
require '../parse/parse'
require 'json'
require 'pp'
class Main
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

  def seek_title?(html,key)
    html.xpath('//div[@class="search_right_item"]').each do |div|
      ##历史名称
      flog = 0
      div.xpath('div/div/div/div[@class="add"]').each do |div|
        txt = div.content.gsub(/\s|\n/,"")
        if  txt =~/历史名称:(.*)/
          flog = 1
        end
      end
      div.xpath('div/div/a').each do |div|
        txt = div.content.gsub(/\n/,"")
        if txt ==key || flog
        puts div['href']
        return 
      end
      end
    end
  end


  def parse_html(url,key)
    html = dow_html(url)
    #如果返回为"0"，休眠4秒再次发起请求
    if html == "0"
      puts "第一次尝试失败，休眠4秒后重新开始！"
      sleep(4)
      puts "开始！"
      html = dow_html(url)
    end

    if login_yes?(html)
      puts "天眼查开始限制查询！需要登录！"
    else
      html.xpath('//div[@class="col-xs-10 search_repadding2 f18"]/a').each do |div|

        txt = div.content.gsub("\n","").gsub(" ","")
        puts txt,key
        if key == txt
          url_details  = div['href']
          puts "#{key}-->天眼查页面#{url_details}"
          #天眼查企业详情页
          html_info = @dow.download_html(url_details)
          #解析页面
          basic_info(html_info)
          break
        else
          puts "没有找到！"
        end
      end
    end
  end

  
  def dow_html(url)
    @dow.download_html(url)
  end
end
def proxy_list
  file = File.open('proxy.csv','r')
  file.each_line do |proxy|
    puts rand(4).to_s,proxy.split(':')
  end 
end
# proxy_list
pas = Main.new
parse = Parse.new
file = pas.dow_html("file:///Users/liuxin/RubymineProjects/tianyancha/main/test6.html")
# proxy_list
root = 'https://www.tianyancha.com/search?key='
pm = '&checkFrom=searchBox'
key = "爱尔眼科医院集团股份有限公司"
url = root + key + pm
pas.seek_title?(file,"贵阳白云城市建设投资有限公司")
# # parse.contact(file)#股票代码和联系方式
# # parse.parse_admin(file)#解析主要人员
# parse.parse_intro(file)#解析企业简介
# parse.parse_shareholder(file)#解析股东信息

# parse.parse_basic_info(file)#解析企业基本信息，所有企业都有
# parse.parse_publish(file)#发行相关
# parse.parse_financing(file)#融资历史
# puts pas.dow_html(url).body

