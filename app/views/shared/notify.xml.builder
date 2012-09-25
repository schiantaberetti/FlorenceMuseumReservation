xml.inspect!
xml.notifications do
	flash.each do |key,msg|
		xml.notification do
			xml.msg key.to_s
			xml.description msg
		end
	end
end
