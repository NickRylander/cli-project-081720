class Scraper

    WORKOUT_URL = "https://www.crossfit.com/workout"
    RELATIVE_URL = "https://www.crossfit.com"
    MONTH_URL = "https://www.crossfit.com/workout/2020"

    def self.scrape_months
        html = open(MONTH_URL)
        doc = Nokogiri::HTML(html)
        doc.css("select#monthFilter.form-control.input-sm").text.strip.split("\n                ").slice(1, 13).each do |name|
            position, mon = name.split(" - ")
            Month.new(mon, position) 
        end
    end
    def self.scrape_month_details(name)
        html = open(MONTH_URL+"/"+name.position)
        doc = Nokogiri::HTML(html)
        doc.css("section#archives.section").each do |days|
            name.every_day = days.css(".show a").text.split
            binding.pry
        end
    end
    # def self.scrape_workouts
    #     html = open(WORKOUT_URL)
    #     doc = Nokogiri::HTML(html)
    #     doc.css(".row.content-container").each do | workout |
    #         date = workout.css(".show a").text.strip
    #         url = workout.css("a").attr("href").value
    #         Workout.new(date, url)
    #         binding.pry
    #     end
    # end
    # def self.scrape_details(workout)
    #     html = open(RELATIVE_URL+workout.url)
    #     doc = Nokogiri::HTML(html)
    #     workout.day = doc.css("._2DHczaLT0rj8e9YIvN_rJG ._3l95QWdJm-5FhMc3sTpEC1").text
    #     workout.details = doc.css(".sf1KM0yG_abhAm_QFxP7E ._6zX5t4v71r1EQ1b1O0nO2.jYZW249J9cFebTPrzuIl0").text
    # end

end