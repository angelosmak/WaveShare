require "open-uri"
require "json"

# bondi beach
api_key = 'd4e1a1852e538a510ed264567f3c800a'

# url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

weather = URI.open(url).read

surf_forecast = JSON.parse(weather)
