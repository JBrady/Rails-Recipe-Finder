require 'rails_helper'
require 'httparty'

RSpec.describe RecipeService, type: :service do
  describe '.search' do
    it 'returns a list of recipes' do
      recipes = RecipeService.search('pizza')

      expect(recipes).to_not be_empty
      expect(recipes.first).to have_key('title')
      expect(recipes.first).to have_key('image')
    end
  end
end