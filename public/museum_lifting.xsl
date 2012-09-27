<xsl:stylesheet version = '1.0'
	xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
<xsl:output method="xml" indent="yes"/>

<xsl:template match="museum">
	<rdf:RDF 
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
	xmlns:db="http://sr-vm091-opend.comune.fi.it:8080/resource/"
	xmlns:pa="http://oldsites.comune.fi.it/resource/vocab/"
	xmlns:d2r="http://sites.wiwiss.fu-berlin.de/suhl/bizer/d2r-server/config.rdf#"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
	xmlns:map="file:mapping3.n3#"
	xmlns:data="http://sr-vm091-opend.comune.fi.it:8080/resource/data/"
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	xmlns:vocab="http://sr-vm091-opend.comune.fi.it:8080/resource/vocab/" >

		<rdf:Description >
			<xsl:attribute name="about">http://sr-vm091-opend.comune.fi.it:8080/resource/musei/<xsl:value-of select="translate(name,' ','_')"/></xsl:attribute>
			<rdf:type >
				<xsl:attribute name='rdf:resource'>data:musei</xsl:attribute>
			</rdf:type>
			<rdfs:label><xsl:value-of select="name"/></rdfs:label>
			<vocab:indirizzo><xsl:value-of select="address"/></vocab:indirizzo>
			<pa:numeroTelefonoFisso><xsl:value-of select="phone"/></pa:numeroTelefonoFisso>
			<vocab:tipologia><xsl:value-of select="typology"/></vocab:tipologia>
			<pa:webLink><xsl:value-of select="webLink"/></pa:webLink>
		</rdf:Description>


	</rdf:RDF>	
</xsl:template>


</xsl:stylesheet>
