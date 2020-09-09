class Workout
    @@all = []

    attr_accessor :date, :url, :workout

    def initialize(date, url)
        @date = date
        @url = url
        @workout = workout
        @@all << self
    end

    def self.all
        @@all
    end

end