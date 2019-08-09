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
end
