require 'net/http'
require 'json'
require 'dotenv/load'
require './weather'

p Weather.city_weather(ARGV[0])
