xml.instruct!
xml.reservations do
  @reservations.each do |res|
		xml.reservation "#{reservations_url}/#{res.id}"
#    xml.reservation do
#      xml.museum res.museum
#      xml.date res.date
#			xml.num_of_people res.num_of_people
#    end
  end unless @reservations.nil?
end
