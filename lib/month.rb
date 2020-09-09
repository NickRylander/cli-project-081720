class Month
    @@all = []

    attr_accessor :mon, :position, :each_day, :day_url

    def initialize(mon, position)
        @mon = mon
        @position = position
        @each_day = each_day
        @day_url = day_url
        @@all << self
    end

    def self.all
        @@all
    end

end