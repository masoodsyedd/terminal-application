require 'tty-prompt'
require_relative './classes/stadium'
require_relative './classes/court'
require_relative './classes/history'
require_relative './classes/booking'
require_relative './methods/headers'

# Create a stadium and courts
stadium = Stadium.new.add_court(Gold.new).add_court(Diamond.new).add_court(Platinum.new)

# Welcome message
clear
welcome(stadium)

# Enter Cat guest details
puts "\n    Hi there! \n\n"
puts "Please enter your name: \n\n"

# Creating a cat - loop to make sure the user types in something. This exits out of the loop if the user does not type anything in after 3 tries. 
# In the future we could use some regex to make sure the user formats a cat name to some standard, such as starting with a letter. 
name_count = 0
while name_count < 3
  your_name = gets.chomp.capitalize

  # exits the loop if the user types in a name
  if your_name != "" 
    clear
    break

  # continues the loop until the user types in a name, or until the name_count is greater than three. 
  else
    name_count += 1
    if name_count == 3
      clear
      puts "\n\n Oops! Please enter a name"
      your_name = "Enter a name"
    else
      puts "Ooops, please enter your name:"
    end
  end
end

# Creates a new object, and reaffirms to the user their input with a greeting. 
cat = History.new(your_name)
puts "\n\n Hello #{cat.name}!"

# Main Application Loop - menu options
while true
  
  # Display stadium menu options using TTY-Prompt gem
  welcome(stadium)
  selection = TTY::Prompt.new.select("How may we assist you today? Please select from the following options:",  cycle: true, marker: '>', echo: false) do |menu|
    menu.choice('Make a new booking', 1)
    menu.choice('View an existing booking', 2)
    menu.choice('View Stadium Court', 3)
    menu.choice('View Stadium information', 4)
    menu.choice('Exit', 5)

    case selection

    # 1. Make a new booking
    when 1

      # A booking has already been created
      if cat.booking
        clear
        welcome(stadium)
        puts "\n\n\n You already have a booking! \n\n\n"

      # If there is no booking, creates a booking
      else
        # Display list of court types and select a court
        new_booking_header
        court = stadium.select_court
        
        # Displays the court details, including availability
        # The user selects the days they want for the booking
        new_booking_header
        court.display_court
        court.display_features
        booking_days = court.select_days

        # checks if user has selected days
        while booking_days.length == 0
          new_booking_header
          puts "\n\n Ooops, no days were selected. \n\n\n"
          booking_days = court.select_days
        end

        # creates the booking
        cat.booking = Booking.new(court, booking_days)

        # loading screen
        loading_screen("Loading your booking right now......")


        # Displays the booking for user including price
        clear
        puts "Thank you for your booking!"
        cat.booking.display_booking(cat, stadium)
        back_main_menu
      end

    # View an existing booking
    when 2
        
      if cat.booking
        # View an existing booking
        clear
        cat.booking.display_booking(cat, stadium)
        back_main_menu
      else
        # Or, if there is no booking, displays an error message
        clear
        welcome(stadium)
        puts "\n\n  Ooops, sorry, you don't have a booking yet! \n\n\n"
      end

    # View stadium court types
    when 3
      # user selects a court type to view
      view_courts_header
      court = stadium.select_court
      
      # Display details of court selected
      court_name_header(court.type)
      court.display_court
      court.display_features
      court.display_availability
      back_main_menu

    # View about the stadium and contact information
    when 4
      clear
      stadium.stadium_info
      back_main_menu

    # Quit
    when 5
      # Goodbye message if the user has created a booking
      if cat.booking
        clear
        puts "Thank you #{your_name}!"
        puts "We look forward to seeing you at Coder Academy Stadium #{cat.booking.days[0]}." 
        puts "Enjoy your day!"
        return
      
      # Goodbye message if a booking hasn't been created
      else 
        clear
        puts "Thank you #{your_name}"
        puts "We hope you book with us soon!"
        puts "Enjoy your day!"
        return
      end
    end
  end
end