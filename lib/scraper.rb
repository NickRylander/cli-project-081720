class Scraper

    WORKOUT_URL = "https://www.crossfit.com/workout"
    RELATIVE_URL = "https://www.crossfit.com"

    def self.scrape_workouts
        html = open(WORKOUT_URL)
        doc = Nokogiri::HTML(html)
        doc.css(".row.content-container").each do | workout |
            date = workout.css(".show a").text.strip
            url = workout.css("a").attr("href").value
            Workout.new(date, url)
        end
    end
    def self.scrape_details(workout)
        html = open(RELATIVE_URL+workout.url)
        doc = Nokogiri::HTML(html)
        workout.day = doc.css("._2DHczaLT0rj8e9YIvN_rJG ._3l95QWdJm-5FhMc3sTpEC1").text
        workout.details = doc.css(".sf1KM0yG_abhAm_QFxP7E ._6zX5t4v71r1EQ1b1O0nO2.jYZW249J9cFebTPrzuIl0").text
    end

end

# ROW.CONTAINER EACH
# .ROW.CONTENT-CONTAINER

# all_workout_titles = doc.css("div.content-container .show a").text
# todays_workout_title = doc.css("div.content-container .show a").first.text.strip
# all_workout_details = doc.css("div.content-container .row .col-sm-6").text
# todays_workout_details = doc.css("div.content-container .row .col-sm-6").first.text.strip