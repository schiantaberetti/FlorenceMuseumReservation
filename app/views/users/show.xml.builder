xml.instruct!
xml.user do
	xml.name @current_user.name 
	xml.email @current_user.email 
	xml.reservations reservations_url 
end
