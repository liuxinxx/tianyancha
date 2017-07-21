ip_post = "222.95.16.205:808"
ip = ip_post[0,ip_post.index(":")]
post = ip_post[ip_post.index(":")+1,ip_post.size].to_i
p ip
p post