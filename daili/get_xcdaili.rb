# encoding: utf-8

#从西刺代理获取代理IP
require 'mechanize'
$sum = 0
class Get_xici_daili
	#解析IP,并存入csv中
	def parse_ip(url)
		# url = 'http://www.xicidaili.com/nn/'
		ip_list = Array.new#存放代理
		html = html(url)
		html.xpath('//table[@id="ip_list"]/tr').each do |tr|
			flog = 0
			ip = ''
			post = ''
			tr.xpath('td').each do |td|
				flog +=1			
				txt = td.content.gsub("\n","").gsub(" ","")
				if flog ==2
					ip = txt
				end
				if flog ==3
					post = txt
					
					putss ip+":"+post
					ip_list.push(ip+":"+post)
					#将能用的代理存入数组
					if time_out?(ip,post.to_i)
						putss "#{ip}:#{post}存入文件！"
						save_daili(ip+":"+post+"\n")
						$sum+=1
						# ip_list.push(ip+":"+post)
					else
						putss "#{ip}:#{post}为失效代理！！"
					end
					# save_daili(ip+post+"\n")
					break
				end
			end
		end
		ip_list
	end
	def putss(str)
		time = Time.new
		puts "#{time.strftime("%Y-%m-%d %H:%M:%S")}："+str
	end
	def html(url)
		begin
			agent = Mechanize.new
			# 设置超时
			# agent.set_proxy "122.192.74.83",8080
      agent.open_timeout = 3
			agent.user_agent_alias = 'Mac Safari'
			html = agent.get(url)
			return html
		rescue Exception=> e
			putss "出现异常:"+e.message+"#{url}该链接无法抓取"
			return "0"
		end
	end

	#保存ip到daili.csv
	def save_daili(ip_post)
		file = File.new("qixinbao.csv","ab+")
		file.syswrite(ip_post)
		file.close
	end

	#验证代理是否超时
	#可以用的true
	#不能用的false
	def time_out?(ip,post)
		begin
			agent = Mechanize.new
			agent.set_proxy ip,post
			# 设置超时
			time = Time.new
      agent.open_timeout = 5
			agent.get('https://www.qixin.com/search?key=%E7%88%B1%E5%B0%94%E7%9C%BC%E7%A7%91&page=1')
			putss "耗时#{Time.new - time}此代理可用！🍺 🍺 🍺 🍺 🍺\n"
			return true
		rescue Exception => e
			# putss "出现异常:#{ip}:#{post}"
			return false
		end
	end
end
n = 0
dali = Get_xici_daili.new
url = "http://www.xicidaili.com/nn/"
while true
	n+=1
	puts url+n.to_s
	dali.parse_ip(url+n.to_s)
	if n ==4
		n=0
	end
end 
