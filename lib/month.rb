class Month
    @@all = []

    attr_accessor :mon

    def initialize(mon)
        @mon = mon
        @@all << self
    end

    def self.all
        @@all
    end

end