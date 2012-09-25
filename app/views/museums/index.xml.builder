xml.instruct!
xml.museums do
  slice_page(@museums,museums_url).each do |museum|
    xml.museum do
      xml.name museum
      xml.uri "#{museums_url}/#{museum}"
    end
  end unless @museums.nil?
end
