class RecipesController < ApplicationController
    def search
        query = params[:query]
        results = RecipeService.search(query)
        render json: results
    end
end
