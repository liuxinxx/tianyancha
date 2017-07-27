require './support'
class Hdl

	def parse_ip(url)
		html = Support.download_html(url)
		html.xpath('//table[@class = "table table-bordered table-striped"]/tbody/tr').each do |tr|
			i  = 0
			ip = ''
			post = ''
			tr.xpath('td').each do |td|				i+=1
				
				str  =  td.content
				case i
				when 1
					ip = str
				when 2
					post = str.to_i
				else
					next
				end
			end	
			#将能用的代理存入数组
			if Support.time_out?(ip,post)
				puts "#{ip}:#{post}存入文件！"
				save_daili(ip+":"+post.to_s+"\n")
				# ip_list.push(ip+":"+post)
			else
				puts "#{ip}:#{post}为失效代理！！😯 😯 😯 😯 😯 😯 😯 😯"
			end
	end
end  
	#保存ip到daili.csv
	def save_daili(ip_post)
		file = File.new("puls-1.csv","ab+")
		file.syswrite(ip_post)
		file.close
	end
end
url = 'http://www.kuaidaili.com/free/'
hdl = Hdl.new
hdl.parse_ip(url)