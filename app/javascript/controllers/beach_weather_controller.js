import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="beach-weather"
export default class extends Controller {
  static values = { lat: String, lon: String}
  static targets = ["description", "temperature", "Windspeed","Winddirection", "icon"]
  connect() {
    console.log(this.latValue, this.lonValue)
    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${this.latValue}&lon=${this.lonValue}&units==metric&appid=ea186841ff8ba1d952efa9a35dfa1bed`)
    .then(response => response.json())
    .then(data => {
      console.log(data)
      this.descriptionTarget.insertAdjacentHTML("beforeend", data.weather[0].description)
      this.temperatureTarget.insertAdjacentHTML("beforeend", `${Math.round(data.main.temp-273.15)}`)
      const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']
      const windDir = directions[Math.round(data.wind.deg / 45) % 8]
      this.WindspeedTarget.insertAdjacentHTML("beforeend", `Windspeed: ${data.wind.speed} m/s`)
      this.WinddirectionTarget.insertAdjacentHTML("beforeend", `Winddirection: ${windDir}`)
      this.iconTarget.src=`https://openweathermap.org/img/w/${data.weather[0].icon}.png`
    })
}}
