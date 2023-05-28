class RecipeFetcher
    include HTTParty
    
    base_uri 'https://api.spoonacular.com/recipes'
    API_KEY = Rails.application.credentials.dig(:spoonacular, :api_key)
  
    format :json
  
    def self.search(query)
      Rails.cache.fetch("recipes/#{query}", expires_in: 12.hours) do
        response = get("/complexSearch", query: { query: query, apiKey: API_KEY})
        if response.success?
          response.parsed_response["results"]
        else
          raise HTTParty::ResponseError, "API request failed with code #{response.code}: #{response.message}"
        end
      end
    end
  
    def self.fetch_recipe(id)
      Rails.cache.fetch("recipe/#{id}", expires_in: 12.hours) do
        response = get("/#{id}/information", query: { apiKey: API_KEY })
        if response.success?
          response.parsed_response
        else
          raise HTTParty::ResponseError, "API request failed with code #{response.code}: #{response.message}"
        end
      end
    end
  end
  