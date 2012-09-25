xml.instruct!
xml.museums do
  slice_pages(@museums,museums_url).each do |museum|
    xml.museum do
      xml.name museum
      xml.uri "#{museums_url}/#{museum}"
    end
  end unless @museums.nil?
end
