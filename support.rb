  # encoding: utf-8
require 'mechanize'
require 'rubygems'
require 'net/http'
require 'open-uri'
class Dow
  def download_html(url)
    puts "开始下载#{url}页面！"
    # dali = Get_xici_daili.new
    # ip_list = Array.new
    begin
      agent = Mechanize.new
      # puts "当前代理池，存在#{ip_list.size}个！"
      # while true
      #   if ip_list.size==0
      #     ip_list = dali.parse_ip
      #     break
      #   else
      #     break
      #   end
      # end
      # random = Random.new(ip_list.size)
      # #随机取出一个代理
      # ip_post = ip_list[random]
      # ip = ip_post[0,ip_post.index(":")]
      # post = ip_post[ip_post.index(":"),ip_post.size]
      # agent.set_proxy "110.72.19.168",8123
      # 设置超时
      agent.open_timeout = 10
      agent.user_agent_alias = 'Mac Safari'
      
      html = agent.get(url)
      return html
    rescue Exception=> e
      puts "出现异常:"+e.message+"#{url}该链接无法抓取"
      # ip_list.delete(ip_post)
      return "0"
    end
  end  
end
