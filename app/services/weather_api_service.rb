#use open weather api 
# get data (lat, long, name) about a city  
class WeatherApiService
    def initialize(cities)
        @cities = cities
    end

    def self.perform(cities)
        new(cities).perform
    end

    def perform
        recover_data
    end

    private

    def recover_data
        client = call_api
        data_per_city = {}
        @cities.each do |city|
            city_data = client.current_weather(city: city)
            data_per_city[city_data.name] = {
                'coord' => city_data.coord,
                'temp' => transform_kelvin_to_celsius(city_data.main['temp']),
                'feeling' => transform_kelvin_to_celsius(city_data.main['feels_like']),
                'wind' => city_data.wind['speed']
            }
        end
        data_per_city
    end

    def transform_kelvin_to_celsius(kelvin)
        (kelvin - 273.15).round(1)
    end

    def call_api
        OpenWeather::Client.new(api_key: $open_weather_key)
    end
end