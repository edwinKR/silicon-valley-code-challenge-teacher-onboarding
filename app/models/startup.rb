class Startup
    attr_reader :founder, :domain
    attr_accessor :company_name 

    @@all = []

    def initialize(company_name, founder, domain)
        @company_name = company_name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, company_name)
        @domain = domain
        @company_name = company_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        domains = []
        @@all.each do |startup|
            domains << startup.domain
        end

        domains
    end

    def sign_contract(vc, funding_round_type, investment)
        FundingRound.new(self, vc, funding_round_type, investment)
    end
    
    def num_funding_rounds        
        found_startup = self.single_startup_list_of_funding_rounds
        found_startup.count
    end
    
    def total_funds
        found_startup = self.single_startup_list_of_funding_rounds
        found_startup.inject(0) do |sum, round| 
            sum + round.investment
        end
    end

    def investors
        found_startup = self.single_startup_list_of_funding_rounds
        found_all_fundings = found_startup.uniq { |round| round.vc }
        found_all_fundings.map { |round| round.vc}
    end

    def big_investors
        self.investors.select do |vc|
            VentureCapitalist.tres_commas_club.include?(vc)
        end  
    end

    # helper function
    def single_startup_list_of_funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

end
