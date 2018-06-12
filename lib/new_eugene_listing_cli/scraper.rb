class NewEugeneListingCli::Scraper

  def get_page
    Nokogiri::HTML(rpage = open("https://www.trulia.com/for_sale/Eugene,OR/date;d_sort/", "User-Agent" => "User").read)
  end

  def scrape_properties_index
    listings = self.get_page.css(".xsCol12Landscape")
    listings.map do |listing|
      listing.css(".typeHighlight").text == "< 1 Day on Trulia"
    end
    listings
  end

  def build_properties
    scrape_properties_index.each {|p| NewEugeneListingCli::Listing.new_from_index_page(p)}
  end

end
