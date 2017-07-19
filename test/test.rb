require '../sup.rb'
class Test
  def initialize
    @dow = Dow.new
  end
  def dow_html(url)
    @dow.download_html(url)

  end
end

url = 'https://www.tianyancha.com/search?key=%E9%87%91%E9%BC%8E%E5%8D%B0%E4%B8%9A&checkFrom=searchBox'
tt = Test.new
puts tt.dow_html(url).body