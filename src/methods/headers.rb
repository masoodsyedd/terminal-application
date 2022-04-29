# Some beautiful headers and useful functions for our main app

require 'tty-prompt'

# Line for the headers
HEADER_LINE = "--------------------------------------------------------------"
HEADER_LENGTH = HEADER_LINE.length

# clears the screen
def clear
  puts "\e[2J\e[f"
end

# Returns user to the main menu
def back_main_menu
  puts "\n\n Press any key to go back to the main menu"
  $stdin.getch
  clear
end

# Annoying loading screen :)  -- Having some fun with the application
def loading_screen(string)                                           
  string.length.times do |i| # Iterates over each index in a given string
    # Clear the screen to provide an animated effect.
    clear
    
    # Please wait header 
    puts HEADER_LINE
    puts "Please Wait...".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
    puts
    
    # Displays all characters in the string up to the index being iterated over.
    puts string[0, i].center(HEADER_LENGTH)
    sleep(0.2)
  end
end

# Welcome to the app & stadium
def welcome(stadium)
  puts
  puts HEADER_LINE
  puts "WELCOME TO THE".center(HEADER_LENGTH)
  puts "#{stadium.name} stadium!".center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
end

# header for when placing a new booking
def new_booking_header
  clear
  puts
  puts HEADER_LINE
  puts "Create a new booking right now!".upcase.center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
end

# header for when selecting courts to view
def view_courts_header
  clear
  puts
  puts HEADER_LINE
  puts "View Court".upcase.center(HEADER_LENGTH)
  puts HEADER_LINE
  puts
end

# header for when viewing selected court
def court_name_header(court_name)
  clear
  puts
  puts HEADER_LINE
  puts "#{court_name} Court".upcase.center(HEADER_LENGTH)
  puts HEADER_LINE
end
