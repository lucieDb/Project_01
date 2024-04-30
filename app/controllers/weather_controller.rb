require_relative '../.api_key.rb'

class WeatherController < ApplicationController

  CITIES_VISITED = %w(paris london tokyo amsterdam porto ljubljana rome praslin denpasar athens heraklion )

  def index
    @data = WeatherApiService.perform(CITIES_VISITED)
  end
end
