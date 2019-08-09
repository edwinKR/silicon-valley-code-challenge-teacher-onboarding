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
        min_amount = 1000000000 
        @@all.select do |vc|
            vc.total_worth >= min_amount
        end
    end
end