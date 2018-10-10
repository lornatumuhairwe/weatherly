require 'net/http'
require 'json'
require 'dotenv/load'

def fetch_weather(city)
  end_point = URI("https://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{ENV['API_KEY']}")
  Net::HTTP.get_response(end_point)
end
