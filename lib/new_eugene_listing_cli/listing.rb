class NewEugeneListingCli::Listing
  attr_accessor :address, :price, :bedrooms, :bathrooms, :url, :sq_feet, :property_type, :property_description

  @@all = []

  def self.all
    @@all
  end

  def initialize(address = nil, price = nil, bedrooms = nil, bathrooms = nil, url = nil)
    @address = address
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @url = url
    @@all << self
  end

  def self.new_from_index_page(p)
    self.new(p.css(".addressDetail .h6").text.strip, p.css(".cardPrice").text.strip, p.css("[data-auto-test='beds']").text.gsub("bd", "").strip,
    p.css("[data-auto-test='baths']").text.gsub("ba", "").strip, "https://www.trulia.com" + p.css("a")[0]["href"].strip)
  end

  def sq_feet
    @sq_feet ||= doc.css(".listInlineBulleted li")[2].text.strip
  end

  def property_type
    @property_type ||= doc.css(".xsColOffset4 li")[0].text.strip
  end

  def property_description
    @property_description ||= doc.css("p#propertyDescription").text.strip
  end

  def doc
    @doc = Nokogiri::HTML(rpage = open(self.url, "User-Agent" => "User").read)
  end
end
