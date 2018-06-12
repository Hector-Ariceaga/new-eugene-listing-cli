class NewEugeneListingCli::CLI

  def call
    display_listings
    menu
    close
  end

  def display_listings
    puts "The following are property listings in Eugene that are less than 24 hours old:"
  end

  def menu
    input = nil
    while input != "exit"
      puts  "Please enter the number of the property you would like to see more information about or 'listings' to see the listings again or 'exit':"
      input = gets.strip.downcase
      if input == 'listings'
        display_listings
      elsif input == "1"
        puts "More details about Example Address 1"
      elsif input == "2"
        puts "More details about Example Address 2"
      else
        "I'm sorry, I don't understand. Please enter the number of the property you would like to see more information about:"
      end
    end
  end

  def close
    puts "Thank you for using. Hope to see you again soon!"
  end

end
