
class Stadium
    attr_reader :courts, :name
  
    # We have initialized the stadium with all this data - so that the data is in one location if it needs to be modified.
    # If in the future we were to expand to different locations, we could create stadium subclasses, and hard-code the information in there. 
    def initialize
        @name = "Coder Academy Stadium"
        @address = "49 Basketball Stadium"
        @phone = "0420 BBALL"
        @email = "basketball_courts@gmail.com"
        @about = "~ Basketball Stadium\' ~ \n Seven basketball courts. \n Three netball courts \n Three volleyball courts,\n Two badminton courts can be set up, \n Canteen,\n Amenities and changerooms. "
        @courts = []          # Array of court objects - one advantage of having this array is that when new courts are added to the Stadium class, the rest of the code does not have to be changed, and it will display in the main application. 
    end
  
    # Displays the contact information for the stadium
    def stadium_info
        puts HEADER_LINE
        puts "#{@name.upcase}".center(HEADER_LENGTH)
        puts HEADER_LINE
        puts
        contact_info
        puts
        puts HEADER_LINE
        puts
        puts "   #{@about}"
        puts
        puts HEADER_LINE
    end
  
    # Contact information is seperated from stadium information so that we can use this contact information in different locations if we need it
    def contact_info
        puts " Address: #{@address}"
        puts " Phone No: #{@phone}"
        puts " Email: #{@email}"
    end
  
    # adds a court to the stadium - pushes the court to the courts array
    def add_court(court)
        @courts << court
        return self
    end
  
    # menu to choose a court in the stadium
    def select_court
  
      # These two lines create an array for the menu to display the court names
      menu = []
      @courts.each { |court| menu.push(court.type)} 
  
      # this displays the menu using the TTY-Prompt gem. It returns the selected court
      selection = TTY::Prompt.new.select("Choose a court type:", menu, cycle: true, marker: '>', echo: false)
        @courts.each { |court| return court if court.type == selection }
    end
    end
    
  