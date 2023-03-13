import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temperature"]
  connect() {
    console.log('hello')
    fetch('https://api.weatherapi.com/v1/forecast.json?key=bb8ae13d2adc43af89651804231303&q=-20.122394,57.403180&days=5', {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }


  initialize() {
    this.apiKey = "bb8ae13d2adc43af89651804231303"
  }
}
