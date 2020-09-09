class Month
    @@all = []

    attr_accessor :mon, :position, :every_day, :day_url

    def initialize(mon, position)
        @mon = mon
        @position = position
        @every_day = every_day
        @day_url = day_url
        @@all << self
    end

    def self.all
        @@all
    end

end