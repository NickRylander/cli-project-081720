class Scraper

    WORKOUT_URL = "https://www.crossfit.com/workout"
    RELATIVE_URL = "https://www.crossfit.com"
    def get_path
        html = open(WORKOUT_URL)
        doc = Nokogiri::HTML(open(html))
        doc.css(".row.content-container").each do | workout |
            date = workout.css(".show a").text.strip
            url = workout.css("a").attr("href").value
            binding.pry
        end
    end


end

# ROW.CONTAINER EACH
# .ROW.CONTENT-CONTAINER

# all_workout_titles = doc.css("div.content-container .show a").text
# todays_workout_title = doc.css("div.content-container .show a").first.text.strip
# all_workout_details = doc.css("div.content-container .row .col-sm-6").text
# todays_workout_details = doc.css("div.content-container .row .col-sm-6").first.text.strip