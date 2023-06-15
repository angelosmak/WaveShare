require "open-uri"
require "json"

# bondi beach
api_key = 'ea186841ff8ba1d952efa9a35dfa1bed'
lat = '-33.8919444444'
lon = '151.2730555556'

# url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

weather = URI.open(url).read

surf_forecast = JSON.parse(weather)

# p surf_forecast

p surf_forecast["wind"]
