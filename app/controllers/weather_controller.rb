require_relative '../.api_key.rb'

class WeatherController < ApplicationController

  CITIES_VISITED = %w(paris london tokyo amsterdam porto ljubljana stockholm hongkong bruxelles naples venise seychelles denpasar athens heraklion paros)

  def index
    @data = WeatherApiService.perform(CITIES_VISITED)
  end
end
