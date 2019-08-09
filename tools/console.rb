require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

wework = Startup.new("WeWork", "Adam N.", "www.wework.com")
flatiron = Startup.new("Flatiron", "Adam & Avi", "www.flatironschool.com")

softbank = VentureCapitalist.new("Soft Bank", 2000000000)
samsung = VentureCapitalist.new("Samsung", 1500000000)
mark_cuban = VentureCapitalist.new("Mark Cuban", 900000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line