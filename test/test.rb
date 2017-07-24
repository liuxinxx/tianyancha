require "open-uri"
html = open("http://www.baidu.com", :proxy => 'http://110.73.4.19:8123', :read_timeout => 10).read
p html