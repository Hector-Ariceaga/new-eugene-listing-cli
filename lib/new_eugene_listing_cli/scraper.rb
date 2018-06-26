class NewEugeneListingCli::Scraper

  def get_page
    Nokogiri::HTML(rpage = open("https://www.trulia.com/for_sale/Eugene,OR/date;d_sort/", "User-Agent" => "User").read)
  end

  def scrape_properties_index
    listings = self.get_page.css(".xsCol12Landscape")
    listings.map do |listing|
       if listing.css(".typeHighlight").text == "< 1 Day on Trulia"
         listing
       end
    end
  end

  def build_properties
    scrape_properties_index.each do |p|
      if p != nil
        new_from_index_page(p)
      end
    end
  end

  def new_from_index_page(p)
    @listing = NewEugeneListingCli::Listing.new(p.css(".addressDetail .h6").text.strip, p.css(".cardPrice").text.strip, p.css("[data-auto-test='beds']").text.gsub("bd", "").strip,
    p.css("[data-auto-test='baths']").text.gsub("ba", "").strip, "https://www.trulia.com" + p.css("a")[0]["href"].strip)
    sq_feet
    property_type
    property_description
  end

  def sq_feet
    @listing.sq_feet ||= doc.css(".listInlineBulleted li")[2].text.strip
  end

  def property_type
    @listing.property_type ||= doc.css(".xsColOffset4 li")[0].text.strip
  end

  def property_description
    @listing.property_description ||= doc.css("p#propertyDescription").text.strip
  end

  def doc
    @listing.doc ||= Nokogiri::HTML(rpage = open(@listing.url, "User-Agent" => "User").read)
  end
end
