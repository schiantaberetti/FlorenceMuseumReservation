xml.instruct!
xml.errors do
	@reservation.errors.full_messages.each do |msg|
		xml.error msg
	end
end
