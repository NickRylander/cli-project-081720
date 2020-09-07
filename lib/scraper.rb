class Scraper

    def get_path
        doc = Nokogiri::HTML(open("https://www.crossfit.com/workout"))
        all_workout_titles = doc.css("div.content-container .show a").text
        todays_workout_title = doc.css("div.content-container .show a").first.text.strip
        all_workout_details = doc.css("div.content-container .row .col-sm-6").text
        todays_workout_details = doc.css("div.content-container .row .col-sm-6").first.text.strip
        puts todays_workout_title
        puts todays_workout_details
    end
end

# ROW EACH!!! 

# all_workout_titles = doc.css("div.content-container .show a").text
# todays_workout_title = doc.css("div.content-container .show a").first.text.strip
# all_workout_details = doc.css("div.content-container .row .col-sm-6").text
# todays_workout_title = doc.css("div.content-container .row .col-sm-6").first.text.strip