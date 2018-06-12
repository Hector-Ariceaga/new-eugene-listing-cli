class NewEugeneListingCli::Listing
  attr_accessor :address, :price, :bedrooms, :bathrooms, :sq_feet, :property_type, :description, :url

  @@all = []

  #def self.stub
  #  prop_1 = self.new("address 1", "200,000", 2, 3)
  #  prop_1.sq_feet = "50,000"
  #  prop_1.property_type = "single family home"
  #  prop_1.description = "lots of info"
  #  prop_1.url = "website"

  #  prop_2 = self.new("address 2", "400,000", 4, 3)
  #  prop_2.sq_feet = "250,000"
    #prop_2.property_type = "two family home"
    #prop_2.description = "lots more info"
    #prop_2.url = "web space"
#  end

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
    self.new(p.css("h6").text, p.css("cardPrice").text, p.css("iconBed").text.gsub("bd", "").strip, p.css("iconBath").text.gsub("ba", "").strip)
  end

end
