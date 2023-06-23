require "open-uri"
require "json"

# bondi beach
api_key = '60e223f4f961a95134c63cb32ba647e3'

# url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

url = "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&units==metric&appid=#{api_key}"

weather = URI.open(url).read

surf_forecast = JSON.parse(weather)
