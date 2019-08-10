# Money Unit: In millions. (Ex: $1,000,000,000 =>>> $1,000)

class FundingRound
    attr_reader :startup, :vc
    attr_accessor :funding_round_type, :investment

    @@all = []

    def initialize(startup, vc, funding_round_type, investment = 0)
        @startup = startup
        @vc = vc
        @funding_round_type = funding_round_type
        
        if (investment.kind_of?(Float) && investment >= 0)
            @investment = investment
        else 
            raise ArgumentError, "Investment format float type??!"
        end
        
        @@all << self
    end

    def self.all
        @@all
    end

end
