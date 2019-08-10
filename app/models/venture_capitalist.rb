# Money Unit: In millions. (Ex: $1,000,000,000 =>>> $1,000)

class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        min_amount = 1000 
        @@all.select do |vc|
            vc.total_worth >= min_amount
        end
    end

    def offer_contract(startup, funding_round_type, investment)
        FundingRound.new(startup, self, funding_round_type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.vc == self
        end
    end

    def portfolio
        self.funding_rounds.uniq { |round| round.startup }
    end

    def biggest_investment
        self.funding_rounds.max { |round_current, round_next| round_current.investment <=> round_next.investment }
    end

    def invested(domain)
        found_startup = self.funding_rounds.select { |round| round.startup.domain == domain}
        found_startup.inject(0) { |sum, round| sum + round.investment }
    end
end