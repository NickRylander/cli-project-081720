class CLI
    def run
        puts "Welcome to the CrossFit Workout of the Day!"
        puts "Please choose a day to see the details of each workout: "
        Scraper.scrape_workouts
        list_workouts
        # menu
    end

    def list_workouts
        Workout.all.each.with_index(1) do | workout, i |
            puts "#{i}. #{workout.date}"
        end
    end
end