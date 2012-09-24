xml.inspect!
xml.notifications do
	flash.each do |msg|
		xml.notification msg
	end
end
