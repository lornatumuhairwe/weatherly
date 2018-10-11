module Weather
  module_function

  def error_message(error)
    error.message
  end

  def fetch_weather(city)
    begin
      end_point = URI("https://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{ENV['API_KEY']}")
      response = Net::HTTP.get_response(end_point)
      if response.code == '200'
        response
      else
        error = CustomError.new("The weather for city #{city} could not be retrieved, status code: #{response.code} :(")
        error_message(error)
      end
    rescue Exception => error
      error_message(error)
    end
  end

  def parse_weather_data(data)
    begin
      JSON.parse(data)
    rescue Exception => error
      error_message(error.message)
    end
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
