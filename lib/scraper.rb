class Scraper

    MONTH_URL = "https://www.crossfit.com/workout/2020/"
    RELATIVE_URL = "https://www.crossfit.com/"

    def self.scrape_months
        html = open(MONTH_URL)
        doc = Nokogiri::HTML(html)
        doc.css("select#monthFilter.form-control.input-sm").text.strip.split("\n                ").slice(1, 13).each do |name|
            position, mon = name.split(" - ")
            Month.new(mon, position) 
        end
    end
    def self.scrape_month_details(name)
        html = open(MONTH_URL+name.position)
        doc = Nokogiri::HTML(html)
        doc.css("section#archives.section").css(".show a").each do |day|
            date, url = day.text.split
            Day.new(date, url)
        end
    end
    def self.scrape_details(day)
        html = open(RELATIVE_URL+day.url)
        doc = Nokogiri::HTML(html)
        day.details = doc.css("div._6zX5t4v71r1EQ1b1O0nO2.jYZW249J9cFebTPrzuIl0").text
    end
end