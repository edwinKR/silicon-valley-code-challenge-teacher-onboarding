require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Money Unit: In millions. (Ex: $1,000,000,000 =>>> $1,000)

# Creating startup instances
wework = Startup.new("WeWork", "Adam N.", "www.wework.com")
flatiron = Startup.new("Flatiron", "Adam & Avi", "www.flatironschool.com")
wegrow = Startup.new("WeGrow", "Rebekah N.", "www.wegrow.com")

# Creating venture capitalists instances
softbank = VentureCapitalist.new("Soft Bank", 5000)
samsung = VentureCapitalist.new("Samsung", 1500)
mark_cuban = VentureCapitalist.new("Mark Cuban", 900)

# Creating Funding_Round instances
funding_one = FundingRound.new(wework, softbank, "Series A", 500.00)
funding_two = FundingRound.new(flatiron, mark_cuban, "Pre-Seed", 50.00)
funding_three = FundingRound.new(wework, samsung, "Series B", 100.00)
funding_four = FundingRound.new(wework, softbank, "Series B", 150.00)

# Error handlers: Break out if investment aren't floats or is a negative number
# funding_four = FundingRound.new(wework, softbank, "Series B", 150)
# funding_four = FundingRound.new(wework, softbank, "Series B", -1)

# Flatiron(startup) signing contract with a  VC(Softbank)
flatiron_sign_with_softbank = flatiron.sign_contract(softbank, "Series A", 15.00)
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

# Softbank(VC)'s status:
softbank_first_funding_wegrow = softbank.offer_contract(wegrow, "Series B", 300.00)
softbank_entire_fundings = softbank.funding_rounds
softbank_portfolio_before = softbank.portfolio
softbank_biggest_funding_before = softbank.biggest_investment

softbank_second_funding_wegrow = softbank.offer_contract(wegrow, "Series C", 800.00)
softbank_portfolio_after = softbank.portfolio
softbank_biggest_funding_after = softbank.biggest_investment
softbank_total_funding_for_wegrow = softbank.invested("www.wegrow.com")


binding.pry
0 #leave this here to ensure binding.pry isn't the last line