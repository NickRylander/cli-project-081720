class Day
    @@all = []

    attr_accessor :date, :url, :name, :day, :month, :details

    def initialize(date, url)
        @date = date
        @url = url
        @day = day
        @@all << self
    end

    def self.all
        @@all
    end
end