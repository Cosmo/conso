module Api
  class RecommendationsController < ApplicationController
    def index
      @recommendations = Product.all
    end
  end
end
