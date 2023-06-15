import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="beach-weather"
export default class extends Controller {
  static values = { lat: String, lon: String}
  connect() {
    console.log(this.latValue, this.lonValue)
  }
}
