import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="beach-weather"
export default class extends Controller {
  static values = { lat: String, lon: String}
  static targets = ["description", "temperature", "Windspeed", "Winddirection", "Sunset", "icon"]
  connect() {

    console.log(this.latValue, this.lonValue)
    fetch(`https://api.openweathermap.org/data/3.0/onecall?lat=${this.latValue}&lon=${this.lonValue}&appid=60e223f4f961a95134c63cb32ba647e3`)
    .then(response => response.json())
    .then(data => {

      console.log(data)
      this.descriptionTarget.insertAdjacentHTML("beforeend", data.current.weather[0].description)
      this.temperatureTarget.insertAdjacentHTML("beforeend", `${Math.round(data.daily[0].temp.day - 273.15)}`)
      const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW']
      const windDir = directions[Math.round(data.current.wind_deg / 45) % 8]
      this.WindspeedTarget.insertAdjacentHTML("beforeend", ` ${data.current.wind_speed} m/s`)
      this.WinddirectionTarget.insertAdjacentHTML("beforeend", `${windDir}`)
      this.iconTarget.src=`https://openweathermap.org/img/w/${data.current.weather[0].icon}.png`
      this.SunsetTarget.insertAdjacentHTML("beforeend", ` ${new Date(data.current.sunset * 1000).toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit' })}`)
    })
}}
