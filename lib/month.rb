class Month
    @@all = []

    attr_accessor :months, :name

    def initialize(months, name)
        @months = months
        @name = name
        # @m_url = m_option
        @@all << self
    end

    def self.all
        @@all
    end

end