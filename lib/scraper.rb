class Scraper

    WORKOUT_URL = "https://www.crossfit.com/workout"
    RELATIVE_URL = "https://www.crossfit.com"
    MONTH_URL = "https://www.crossfit.com/workout/2020"

    def self.scrape_months
        html = open(MONTH_URL)
        doc = Nokogiri::HTML(html)
        doc.css("div.col-sm-2.col-md-2").each do |month|
            months = month.css("select#monthFilter.form-control.input-sm").text.strip.split("\n                ").slice(1, 13)
              months.each do |name| 
                position, mon = name.split(" - ")
                puts mon
                Month.new(mon) 
                binding.pry
            end
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

# doc.css("select#monthFilter.form-control.input-sm option[02]").text
# doc.css("select#monthFilter.form-control.input-sm option[03]").text
# doc.css("select#monthFilter.form-control.input-sm option[04]").text
# doc.css("select#monthFilter.form-control.input-sm option[05]").text
# doc.css("select#monthFilter.form-control.input-sm option[06]").text
# doc.css("select#monthFilter.form-control.input-sm option[07]").text
# doc.css("select#monthFilter.form-control.input-sm option[08]").text
# doc.css("select#monthFilter.form-control.input-sm option[09]").text
# doc.css("select#monthFilter.form-control.input-sm option[10]").text
# doc.css("select#monthFilter.form-control.input-sm option[11]").text
# doc.css("select#monthFilter.form-control.input-sm option[12]").text
# doc.css("select#monthFilter.form-control.input-sm option[13]").text