require 'net/http'
require 'json'
require 'dotenv/load'
require './weather'
require './custom_error'

city = ARGV.join(" ")
p Weather.city_weather(city)
