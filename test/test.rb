require '../main/stauct'

ss = Stauct.new
sh = ss.main_stauct
sh.each do |key,vol|
	puts key
	vol.each do |key1,vol1|
		puts key1,vol1
	end
end