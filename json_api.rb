require "open-uri"
require "json"

# bondi beach
api_key = 'a613b838c3896d5d763d1733738491f7'

# url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

weather = URI.open(url).read

surf_forecast = JSON.parse(weather)
