class NewEugeneListingCli::CLI

  def call
    NewEugeneListingCli::Scraper.new.build_properties
    display_listings
    menu
    close
  end

  def display_listings
    puts "The following are property listings in Eugene that are less than 24 hours old:"
    @all = NewEugeneListingCli::Listing.all
    @all.each.with_index(1) do |listing, i|
      puts "#{i}. #{listing.address} -- #{listing.price} -- #{listing.bedrooms}bd -- #{listing.bathrooms}ba"
      puts "    #{listing.url}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the property you would like to see more information about."
      puts "You can also type 'listings' to see the listings again or 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0
        if @all[input.to_i - 1] != nil
          this_listing = @all[input.to_i - 1]
          puts "####################################################################################################"
          puts "ADDRESS: #{this_listing.address}"
          puts "PRICE: #{this_listing.price}"
          puts "BEDROOM(S): #{this_listing.bedrooms}"
          puts "BATHROOM(S): #{this_listing.bathrooms}"
          puts "SQUARE FOOTAGE: #{this_listing.sq_feet}"
          puts "PROPERTY TYPE: #{this_listing.property_type}"
          puts "====================================================================================================="
          puts "DESCRIPTION: #{this_listing.property_description}"
          puts ""
          puts ""
        elsif input == 'listings'
          display_listings
        else
          "I'm sorry, I don't understand. Please enter the number of the property you would like to see more information about:"
        end
      end
    end
  end

  def close
    puts "Thank you for using. Hope to see you again soon!"
  end

end
