xml.instruct!
xml.museums do
  @museums.each do |museum|
    xml.museum do
      xml.name museum
      xml.uri "#{museums_url}/#{museum}"
    end
  end unless @museums.nil?
end
