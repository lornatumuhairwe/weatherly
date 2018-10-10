module Weather
  module_function

  def fetch_weather(city)
    end_point = URI("https://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{ENV['API_KEY']}")
    Net::HTTP.get_response(end_point)
  end

  def parse_weather_data(data)
    JSON.parse(data)
  end

  def celcius_convert(temp)
    (temp - 273).round(2)
  end

  def message(body)
    temp = celcius_convert(body['main']['temp'])
    "Current temperature in #{body['name']} is #{temp} degrees celcius."
  end

  def city_weather(city)
    raw_data = fetch_weather(city)
    weather_info = parse_weather_data(raw_data.body)
    message(weather_info)
  end
end
