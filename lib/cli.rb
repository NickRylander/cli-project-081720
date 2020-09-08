class CLI
    def run
        puts "Welcome to the CrossFit Workout of the Day!"
        puts "Please choose a day to see the details of each workout: "
        Scraper.scrape_workouts
        list_workouts
        menu
    end
    def list_workouts
        Workout.all.each.with_index(1) do | workout, i |
            puts "#{i}. #{workout.date}"
        end
    end
    def menu
        puts "Please type a number to see the workout!"
        input = gets.chomp
        if !input.to_i.between?(1, Workout.all.length)
            puts "Please choose a number from the list! ;)"
            list_workouts
        else
            puts "Great choice! Ready to sweat?"
            workout = Workout.all[input.to_i-1]
            display_details(workout)
        end
    end
    def display_details(workout)
        Scraper.scrape_details(workout)
        puts "Just incase you forgot the day you wanted, it's #{workout.day}!"
        # puts "#{workout.day}"
        puts "Workout Details:"
        puts "#{workout.details}"
    end
end