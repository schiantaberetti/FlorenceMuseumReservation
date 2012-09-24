module MuseumsHelper
	SPARQL_ENDPOINT = "http://sr-vm091-opend.comune.fi.it:8080/sparql"

	SPARQL_LABEL_PREDICATE = "<http://www.w3.org/2000/01/rdf-schema#label>"
	SPARQL_PHONE_PREDICATE = "<http://oldsites.comune.fi.it/resource/vocab/numeroTelefonoFisso>"
	SPARQL_WEBLINK_PREDICATE = "<http://oldsites.comune.fi.it/resource/vocab/webLink>"
	SPARQL_ADDRESS_PREDICATE = "<http://sr-vm091-opend.comune.fi.it:8080/resource/vocab/indirizzo>"
	SPARQL_TYPOLOGY_PREDICATE = "<http://sr-vm091-opend.comune.fi.it:8080/resource/vocab/tipologia>" 
	SPARQL_TYPE_PREDICATE = "<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>"

	SPARQL_OBJECT_MUSEUM = "<http://sr-vm091-opend.comune.fi.it:8080/resource/data/musei>"

	class Museum
		attr_accessor :name, :phone, :webLink, :address, :typology
	end

	def getMuseumsList
		sparql = SPARQL::Client.new(SPARQL_ENDPOINT)
		result = sparql.query("select ?name where { ?museum #{SPARQL_LABEL_PREDICATE} ?name.  ?museum #{SPARQL_TYPE_PREDICATE} #{SPARQL_OBJECT_MUSEUM} }")
		museums = []
		result.each  do |solution|
			museums.append(solution[:name].to_s.gsub(' ','_'))
		end		
		museums
	end

	def getMuseum(museum_name)
		museum_resource="<http://sr-vm091-opend.comune.fi.it:8080/resource/musei/#{museum_name}>"
		
		sparql = SPARQL::Client.new(SPARQL_ENDPOINT)
		
		#testo se il museo esiste
		result = sparql.query("select ?name where { #{museum_resource} #{SPARQL_LABEL_PREDICATE} ?name.  #{museum_resource} #{SPARQL_TYPE_PREDICATE} #{SPARQL_OBJECT_MUSEUM}}")
		
		unless result.empty?
			museum = Museum.new
			museum.name = result[0].name

			result = sparql.query("select ?value where { #{museum_resource} #{SPARQL_PHONE_PREDICATE} ?value. }")
			museum.phone =result[0].value unless result.empty?
			
			result = sparql.query("select ?value where { #{museum_resource} #{SPARQL_WEBLINK_PREDICATE} ?value. }")
			museum.webLink=result[0].value unless result.empty?
			
			result = sparql.query("select ?value where { #{museum_resource} #{SPARQL_ADDRESS_PREDICATE} ?value. }")
			museum.address = result[0].value unless result.empty?
			
			result = sparql.query("select ?value where { #{museum_resource} #{SPARQL_TYPOLOGY_PREDICATE} ?value. }")
			museum.typology=result[0].value unless result.empty?
			
			return museum
		end
		return nil
	end

end
