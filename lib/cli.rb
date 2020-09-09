class CLI
    def run
        puts "Welcome to the CrossFit Workout of the Day!"
        puts "Please choose a month!"
        Scraper.scrape_months
        list_months
        month_menu
    end

    # -------------------- MENUS --------------------

    def month_menu
        puts "Please type in the number that associates with the month you'd like to see!"
        input = gets.chomp
        if !input.to_i.between?(1, Month.all.length)
            puts "Please choose a number from the list! ;)"
                list_months
        else
            puts "Great choice!\n\n"
            name = Month.all[input.to_i-1]
            month_details(name)
        end
    end
    def day_menu
        puts "Please type a number to see the workout for that day!"
        input = gets.chomp
        if !input.to_i.between?(1, Day.all.length)
            puts "Please choose a number from the list! ;)"
            list_days
        else
            puts "Great choice! Ready to sweat?"
            workout = Day.all.reverse[input.to_i-1]
            Scraper.scrape_details(workout)
            display_details(workout)
            puts "Haven't had enough?! Want to see another?"
            puts "Type \"Y\" for more soul crushing or \"N\" for soul already crushed."
            another_workout = gets.chomp.downcase
        end
        if another_workout == "y"
            puts "You're crazy, but I like it."
            list_days
            day_menu
        elsif another_workout == "n"
            puts "Go take a nap!"
            exit
        elsif !another_workout.to_i.between?(1, Day.all.length)
            day_menu
        end
    end

    # -------------------- DETAILS --------------------

    def month_details(name)
        Scraper.scrape_month_details(name)
        puts "You chose: #{name.mon}.\n\n"
        puts "Here is a list of all the days in #{name.mon}:\n\n"
        list_days
        day_menu
    end
    def display_details(workout)
        puts "Workout Details:\n\n"
        puts "#{workout.details}\n ---END---"
    end

    # --------------------- LISTS --------------------

    def list_months
        Month.all.each.with_index(1) do | name, i|
            puts "#{i}. #{name.mon}"
        end
    end
    def list_days
        Day.all.reverse.each.with_index(1) do | day, i|
            puts "#{i}. #{day.date} - #{day.url}"
        end
    end
end