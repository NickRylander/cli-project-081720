class Workout
    @@all = []

    attr_accessor :date, :url, :day, :details, :workout

    def initialize(date, url)
        @date = date
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

end