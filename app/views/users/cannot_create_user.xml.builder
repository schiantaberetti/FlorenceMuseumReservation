xml.instruct!
xml.errors do
	@user.errors.full_messages.each do |msg|
		xml.error msg
	end
end
