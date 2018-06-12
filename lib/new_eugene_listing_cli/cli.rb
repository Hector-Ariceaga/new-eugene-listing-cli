class NewEugeneListingCli::CLI

  def call
    listings
    menu
    close
  end

  def listings
    puts "The following are property listings in Eugene that are less than 24 hours old:"
    puts "1. Example Address 1 - $400,000 - 3 br - 2 ba"
    puts "2. Example Address 2 - $250,000 - 2 br - 1.5 ba"
  end

  def menu
    puts  "Please enter the number of the property you would like to see more information about:"
    input = gets.strip.downcase
    if input == "1"
      puts "More details about Example Address 1"
    elsif input == "2"
      puts "More details about Example Address 2"
    else
      "I'm sorry, I don't understand. Please enter the number of the property you would like to see more information about:"
    end
  end

  def close
    puts "Thank you for using. Hope to see you again soon!"
  end

end
