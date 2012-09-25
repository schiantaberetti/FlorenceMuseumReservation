xml.instruct!
xml.reservations do
  slice_page(@reservations,reservations_url).each do |res|
		xml.reservation "#{reservations_url}/#{res.id}"
#    xml.reservation do
#      xml.museum res.museum
#      xml.date res.date
#			xml.num_of_people res.num_of_people
#    end
  end unless @reservations.nil?
end
