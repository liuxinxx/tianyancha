class Parse
#股票代码和联系方式
def contact(html_info)
  puts "\n\n股票代码和联系方式"
  gp = Array.new
  html_info.xpath("/html/body/div[2]/div[1]/div/div/div/div[1]/div[2]/div[2]/div/p").each do |p|
    gp = p.content.gsub(/\s|\n/,"").split(/股|（/)
  end
  if gp.size>0
    puts "股票:#{gp[0]}股"
    puts "股票名称:#{gp[1]}"
    puts "股票代码:#{gp[2].chop}"
  end
  str = ''
  html_info.xpath('//div[@class= "company_header_width ie9Style"]/div/div').each do |div|
    str += div.content.gsub(/\s|下载报告|\n|电话|邮箱|网址|地址/,"")
  end
  if str =~/曾用名(.*)：[0-9]/
    puts "曾用名：#{$1}"
    str = str.gsub($&.gsub("：",""),"")
  end
  a = str.split("：")
  puts "电话：#{a[1]}"
  puts "邮箱：#{a[2]}"
  puts "网址：#{a[3]}"
  puts "地址：#{a[4]}"
end

  ##解析企业基本信息，所有企业都有
  def parse_basic_info(html_info)
    puts "\n\n企业基本信息"
    i = 0

    html_info.xpath('//div[@class="row b-c-white base2017"]/table/tbody/tr/td').each do |td|
      i+=1
      str = td.content.gsub("\n","").gsub(" ","").split("：")
      case i
      when 1
        puts "工商注册号:#{str[1]}"
      when 2
        puts "组织机构代码:#{str[1]}"
      when 4
        puts "统一信用代码:#{str[1]}"
      when 5
        puts "企业类型:#{str[1]}"
      when 6
        puts "纳税人识别号:#{str[1]}"
      when 7
        puts "行业:#{str[1]}"
      when 8
        puts "营业期限:#{str[1]}"
      when 9
        puts "核准日期:#{str[1]}"
      when 10
        puts "登记机关:#{str[1]}"
      when 11
        puts "注册地址:#{str[1]}"
      when 12
        puts "经营范围:#{str[1]}"
      end
      # puts "#{i.to_s}:#{td.content.gsub("\n","").gsub(" ","")}"
    end
  end

  ##上市情况解析
  def parse_listed_company(html_info)
    html_info.xpath("")    
  end

  ##解析企业简介
  def parse_intro(html_info)
    puts "\n\n企业简介"
    i=0
    html_info.xpath('//div[@id="nav-main-stockNum"]/*/*/table/tbody/tr/td').each do |tr|
      i+=1
      str = tr.content.gsub("\n","").gsub(" ","")
      case i
      when 2
        puts "英文名称:#{str}"
      when 4
        puts "曾用名:#{str}"
      when 6
        puts "所属行业:#{str}"
      when 8
        puts "主营业务:#{str}"
      when 18
        puts "注册资本:#{str}"
      when 20
        puts "员工人数:#{str}"
      when 22
        puts "控股股东:#{str}"
      when 24
        puts "实际控制人:#{str}"
      when 26
        puts "最终控制人:#{str}"
      end
    end
  end

  ##解析主要人员
  def parse_admin(html_info)
    puts "\n\n主要人员"
    admin = Hash.new
    #获取职务，可能一个职务有多个人,防止hash的自动去重
    h = 0
    html_info.xpath('//div[@class = "in-block float-left new-border mr10 mb3"]/div').each do |div|
      h+=1
      str = div.content.gsub("\n","").gsub(" ","").gsub(/他.*>/,"")
      if str.size>0
        admin[str+h.to_s] = ""
      end
    end

    #获取人员，和hash一一对应
    a = Array.new
    i =0
    html_info.xpath('//div[@class = "in-block float-left new-border mr10 mb3"]/a').each do |div|
      i+=1
      str = div.content.gsub("\n","").gsub(" ","")
      a[i] = str
    end
    #将人员与职务对应起来
    j = 0
    admin.each do |key,vol|
      j +=1
      admin[key] = a[j]
    end

    admin.each do |key,vol|
      ##去除掉数字输出
      puts "#{key.gsub(/[0-9]/,"")}：#{vol}"
    end
  end

  ##解析股东信息
  def parse_shareholder(html_info)
    puts "\n\n股东信息"
    i = 0
    html_info.xpath('//div[@id = "_container_holder"]/*/table[@class="table  companyInfo-table"]/tbody/tr/td').each do |tr|
      i+=1
      print tr.content.gsub("\n","").gsub(" ","").gsub(/他.*司>/,"")+"   "
      if i ==3
        i=0
        puts
      end

    end    
  end

  #解析详细页面
  def parse_details(html_info)

    html_info.xpath('//tr[@ng-repeat="item in seniorPeople.dataList"]').each do |td|
      puts td.content.gsub("\n","")
    end
    puts "解析完成！"
  end
end