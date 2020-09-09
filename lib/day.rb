class Day
    @@all = []

    attr_accessor :date, :year_month_date, :name, :day

    def initialize(date, year_month_date)
        @date = date
        @year_month_date = year_month_date
        @@all << self
    end

    def self.all
        @@all
    end
end