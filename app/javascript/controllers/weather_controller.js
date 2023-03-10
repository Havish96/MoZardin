import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temperature", "address","date", "time"]
  connect() {

    fetch('https://api.weatherapi.com/v1/forecast.json?key=bb8ae13d2adc43af89651804231303&q=-20.122394,57.403180&days=5', {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then(data => this.#updateGarden(data))

  }


  initialize() {
    this.apiKey = "bb8ae13d2adc43af89651804231303"
  }

  #updateGarden(data) {
    console.log(data)
    this.temperatureTarget.innerText = `${Math.round(data.current.temp_c)} °C`
    this.addressTarget.innerText = data.location.region
    // const today = new Date();
    // const localOffset = data.timezone + today.getTimezoneOffset() * 60
    // const localDate = new Date(today.setUTCSeconds(localOffset))
    // const options = { weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' }
    // const formattedDate = localDate.toLocaleDateString("en-US", options)
    this.dateTarget.innerText = data.location.localtime
  }
}
