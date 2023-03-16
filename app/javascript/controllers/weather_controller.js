import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static values = {
    apiKey: String
  }
  static targets = ["temperature", "address", "region", "condition"]
  connect() {
    console.log(this.apiKeyValue)
    fetch(`https://api.weatherapi.com/v1/forecast.json?key=${this.apiKeyValue}&q=${this.addressTarget.textContent}-mauritius`, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then(data => this.#updateGarden(data))

  }


  // initialize() {
  //   this.apiKey = this.keyValue
  // }

  #updateGarden(data) {
    console.log(data)
    this.temperatureTarget.innerText = `${Math.round(data.current.temp_c)}`
    this.regionTarget.innerText = data.location.region
    this.conditionTarget.innerText = data.current.condition.text
    // const today = new Date();
    // const localOffset = data.timezone + today.getTimezoneOffset() * 60
    // const localDate = new Date(today.setUTCSeconds(localOffset))
    // const options = { weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' }
    // const formattedDate = localDate.toLocaleDateString("en-US", options)
    // this.dateTarget.innerText = data.location.localtime
  }
}
