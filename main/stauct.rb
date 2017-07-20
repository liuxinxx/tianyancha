class Stauct
  def initialize
    @mold = Hash.new               #类型
    @company_name = Hash.new       #名称
    @address = Hash.new            #地理  
    @contact = Hash.new            #联系
    @listed_company = Hash.new     #上市情况
    @financing = Hash.new          #融资情况
    @admin = Hash.new              #管理层
    @business_info = Hash.new      #工商信息 
    

  end
  def main_stauct
  	stauct = Hash.new
  	stauct['类型'] = @mold
  	stauct['名称'] = @company_name
  	stauct['地理'] = @address
  	stauct['联系'] = @contact
  	stauct['上市情况'] = @listed_company
  	stauct['融资情况'] = @financing
  	stauct['管理层'] = @admin
  	stauct['工商信息'] = @business_info
  	init
  	stauct
  end

  def init
  	mold_struct
  	company_name_struct
  	address_struct
  	listed_company_struct
  	financing_struct
  	admin_struct
  	business_info
  end
  def mold_struct
  	@mold['企业'] = ''
  	@mold['事业单位'] = ''
  	@mold['社会组织'] = ''
  	@mold['政府机关'] = ''
  	@mold['外资企业'] = ''
  	@mold['国外政府机关'] = ''
  	@mold['国外组织'] = ''
  end

  def company_name_struct
  	@company_name['简称'] = ''
  	@company_name['标准名称'] = ''
  	@company_name['正式名称'] = ''
  end

  def address_struct
  	@address['电话'] = ''
  	@address['传真'] = ''
  	@address['网址'] = ''
  	@address['邮箱'] = ''
  	@address['公众号'] = ''
  	@address['微博'] = ''
  end

  def listed_company_struct
  	@listed_company['交易所'] = ''
  	@listed_company['代码'] = ''
  	@listed_company['市值'] = ''
  	@listed_company['股本'] = ''
  	@listed_company['价格'] = ''
  	@listed_company['市盈率'] = ''
  	@listed_company['市销率'] = ''
  end

  def financing_struct
  	@financing['轮次'] = ''
  	@financing['金额'] = ''
  	@financing['投资方'] = ''
  end

  def admin_struct
  	@admin['股东'] = ''
  	@admin['管理人员'] = ''
  	@admin['董事'] = ''
  	@admin['监事'] = ''
  end

  def business_info
  	@business_info['社会组织代码'] = ''
  	@business_info['事业单位代码'] = ''
  	@business_info['商业公司机构代码'] = ''

  end
end