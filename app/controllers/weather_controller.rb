require_relative '../.api_key.rb'

class WeatherController < ApplicationController
  def index
    client = client_weather
    @data = client.current_weather(city: 'London')
    @data
  end

  private

  def client_weather
    OpenWeather::Client.new(
      api_key: $open_weather_key
    )
  end
end
