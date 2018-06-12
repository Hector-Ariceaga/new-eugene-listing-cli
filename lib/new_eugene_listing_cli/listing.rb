class NewEugeneListingCli::Listing
  attr_accessor :address, :price, :bedrooms, :bathrooms, :sq_feet, :property_type, :description, :url

  @@all = []

  def self.all
    @@all
  end

  def initialize(address = nil, price = nil, bedrooms = nil, bathrooms = nil)
    @address = address
    @price = price
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @@all << self
  end

  def self.new_from_index_page(p)
    self.new(p.css(".addressDetail .h6").text, p.css(".cardPrice").text, p.css("[data-auto-test='beds']").text.gsub("bd", ""), p.css("[data-auto-test='baths']").text.gsub("ba", ""))
  end

end
