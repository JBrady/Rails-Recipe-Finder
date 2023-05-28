class RecipesController < ApplicationController
    def search
        query = params[:query]
        results = RecipeService.search(query)
        render json: results
    end
    def index
        query = params[:query]
        @recipes = query.present? ? RecipeService.search(query) : []
    end
    def show
        recipe_id = params[:id]
        @recipe = RecipeService.fetch_recipe(recipe_id)
    end
end
