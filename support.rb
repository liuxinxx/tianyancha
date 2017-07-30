  # encoding: utf-8
require 'mechanize'
require 'rubygems'
require 'net/http'
require 'open-uri'
class Dow
  def download_html(url)
    puts "开始下载#{url}页面！"
    begin
      agent = Mechanize.new
      # agent.set_proxy "111.126.94.80",808
      agent.user_agent_alias = 'Mac Safari'
      html = agent.get(url)
      return html
    rescue Exception=> e
      puts "出现异常:~~"+e.message+"~~#{url}该链接无法抓取"
      # ip_list.delete(ip_post)
      return false
    end
  end  
end
