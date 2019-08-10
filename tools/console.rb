require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Creating startup instances
wework = Startup.new("WeWork", "Adam N.", "www.wework.com")
flatiron = Startup.new("Flatiron", "Adam & Avi", "www.flatironschool.com")

# Creating venture capitalists instances
softbank = VentureCapitalist.new("Soft Bank", 2000000000)
samsung = VentureCapitalist.new("Samsung", 1500000000)
mark_cuban = VentureCapitalist.new("Mark Cuban", 900000000)

# Creating Funding_Round instances
funding_one = FundingRound.new(wework, softbank, "Series A", 500000000.00)
funding_two = FundingRound.new(flatiron, mark_cuban, "Pre-Seed", 50000000.00)
funding_three = FundingRound.new(wework, samsung, "Series B", 1000000000.00)
funding_four = FundingRound.new(wework, softbank, "Series B", 1500000000.00)

# Error handlers: Break out if investment aren't floats or is a negative number
# funding_four = FundingRound.new(wework, softbank, "Series B", 1500000000)
# funding_four = FundingRound.new(wework, softbank, "Series B", -1)

# Flatiron(startup) signing contract with a  VC(Softbank)
flatiron_sign_with_softbank = flatiron.sign_contract(softbank, "Series A", 1500000.00)
# Check if FundingRound class has this contract added.
number_of_funding_rounds = FundingRound.all.count
recent_funding_added = FundingRound.all.last

# Find total number of funding rounds a single startup has received
flatiron_total_funding_rounds = flatiron.num_funding_rounds

# Find total amount of investment received for a single startup
flatiron_total_funding_amount = flatiron.total_funds

# Find all the VCs that invested in a single startup
wework_total_funding_rounds = wework.num_funding_rounds   #Should return 3
wework_VC_list = wework.investors
wework_total_VCs = wework_VC_list.count  #Should return less than 2

# Find the big investors(Tres Commas Club) that has funded a single startup
flatiron_TCClub_investors = flatiron.big_investors  #Should return softbank only.


binding.pry
0 #leave this here to ensure binding.pry isn't the last line