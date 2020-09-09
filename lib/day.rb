class Day
    @@all = []

    attr_accessor :date, :year_month_day, :name, :day

    def initialize(date, year_month_day)
        @date = date
        @year_month_date = year_month_day
        @@all << self
    end

    def self.all
        @@all
    end
end