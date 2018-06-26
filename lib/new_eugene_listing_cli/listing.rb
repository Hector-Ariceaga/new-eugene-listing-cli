class NewEugeneListingCli::Listing
  attr_accessor :address, :price, :bedrooms, :bathrooms, :url, :sq_feet, :property_type, :property_description, :doc

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
end
