require "colorize"

class BrooklynMuseum::Cli
  
  def call
  BrooklynMuseum::Scraper.get_exhibitions
    welcome
    list_exhibitions
    pick_exhibition
    goodbye
  end 
  
  
  def welcome
    puts""
    puts "---WELCOME TO BROOKLYN MUSEUM!---".colorize(:green)
    puts""
    puts "Here is the list of our current exhibitions:"
    puts "______________________________________________"
    puts ""
  end 
  
  def list_exhibitions
    @exhibitions = BrooklynMuseum::Exhibitions.all
    @exhibitions.each.with_index(1) do |exhibition, index|
      puts "#{index}. #{exhibition.name} " #number and name of exhibition
      puts ""
    end 
  end 
  
  def pick_exhibition
    input =""
    while input != "exit"
    puts ""
    puts "Enter the number of the exhibition you would like to see more infor on, type  " +    "\n--- 'list' ---".colorize(:yellow) + " the list of current ehibitions again."
    puts ""
    puts "Type " + " 'exit' ".colorize(:red) + " to exit our museum."
   
    input=gets.strip.downcase
    
    if input == "list"
      list_exhibitions
    puts""
    elsif input.to_i > @exhibitions.length 
    puts "Bad choice!".colorize(:red)
    elsif  input.to_i > 0
      selection = @exhibitions[input.to_i-1]
      puts ""
      puts "------#{selection.name}------".colorize(:green)
      puts ""
      puts "Here are the exhibition dates:  " + " #{selection.dates}".colorize(:green)
      puts ""
      puts "To find out more about this exhibition, please follow the link:"
      puts ""
      puts "#{selection.url}".colorize(:green)
      puts ""
    
   end #of elsif
  end #of if
 end #of pick_exhibition
  
  def goodbye
    puts""
    puts "Thank you for visiting our museum!".colorize(:green)
    puts ""
    puts "Goodbye!"
    puts ""
  end #of goodbye
 
end #end of class

 