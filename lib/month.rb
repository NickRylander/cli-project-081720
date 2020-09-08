class Month
    @@all = []

    attr_accessor :months, :m_url

    def initialize(months, m_url)
        @months = months
        @m_url = m_url
        @@all << self
    end

    def self.all
        @@all
    end

end