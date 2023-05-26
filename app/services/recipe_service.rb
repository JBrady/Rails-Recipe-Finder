require 'httparty'

class RecipeService
    include HTTParty

    BASE_URL = 'https://api.spoonacular.com/recipes'
    API_KEY = ENV['SPOONACULAR_API_KEY']

    def self.search(query)
        # send the request to the API
        response = HTTParty.get("#{BASE_URL}/complexSearch?query=#{query}&apiKey=#{API_KEY}")

        # if the request was successful, parse the response body and return the recipes
        if response.success?
            response.parsed_response["results"]
        else
            # if the request failed, raise an error
            raise HTTParty::ResponseError, "API request failed with code #{response.code}: #{response.message}"
        end
    end
end