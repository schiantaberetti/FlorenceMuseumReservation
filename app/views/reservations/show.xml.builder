xml.instruct!
xml.reservation do
	xml.museum "#{museums_url}/#{@reservation.museum}"
	xml.date @reservation.date
	xml.num_of_pipl @reservation.num_of_people
	xml.user "#{users_url}/#{@reservation.user_id}"
end
