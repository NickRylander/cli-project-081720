class Month
    @@all = []

    attr_accessor :mon, :position

    def initialize(mon, position)
        @mon = mon
        @position = position
        @@all << self
    end

    def self.all
        @@all
    end

end