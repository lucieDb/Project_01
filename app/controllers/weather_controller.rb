class WeatherController < ApplicationController
  def index
    client = client_weather
    data = client.current_weather(city: 'London')
    data.name
  end

  private

  def client_weather
    OpenWeather::Client.new(
      api_key: ENV['OPEN_WEATHER_API_KEY']
    )
  end
end
