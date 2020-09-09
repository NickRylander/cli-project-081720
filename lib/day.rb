class Day
    @@all = []

    attr_accessor :date, :url, :name, :day

    def initialize(date, url)
        @date = date
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end
end