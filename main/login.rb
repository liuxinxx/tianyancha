require 'mechanize'
require '../sup'
class Login
  def initialize
    @dow = Dow.new
  end

  def go_login(url)
    page = @dow.download_html(url)
    page.forms.each do |form|
      puts form.name('Name')
    end
  end
end
url = 'https://www.tianyancha.com/login'
log = Login.new
log.go_login(url)