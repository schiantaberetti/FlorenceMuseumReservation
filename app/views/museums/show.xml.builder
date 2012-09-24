xml.instruct!
xml.museum do
	xml.name @museum.name
	xml.phone @museum.phone if @museum.phone
	xml.address @museum.address if @museum.address
	xml.typology @museum.typology if @museum.typology
	xml.webLink @museum.webLink if @museum.webLink
end unless @museum.nil?
