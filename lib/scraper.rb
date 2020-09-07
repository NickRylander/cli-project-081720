class Scraper

    def get_path
        doc = Nokogiri::HTML(open("https://www.crossfit.com/workout/"))
        binding.pry
    end
    # URL = "https://www.crossfit.com/workout/"

    # def get_workouts
    #     uri = URI.parse(URL)
    #     response = Net::HTTP.get_response(uri)
    #     response.body
    #     JSON.parse(response.body)
    #     binding.pry
    # end
end