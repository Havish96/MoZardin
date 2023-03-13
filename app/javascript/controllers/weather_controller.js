import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temperature"]
  connect() {
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



  fetchWeatherByCoordinates() {
    console.log('weather')
    fetch('https://api.weatherapi.com/v1/forecast.json?key=bb8ae13d2adc43af89651804231303&q=-20.122394,57.403180&days=5')
      .then(response => response.json())
      .then(data => {
        console.log(data)
      })
    console.log('weather')
  }





  #updateCard(data) {
    this.iconTarget.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`
    this.temperatureTarget.innerText = `${Math.round(data.main.temp)} °C`
    this.descriptionTarget.innerText = data.weather[0].description
    this.cityTarget.innerText = data.name
    const today = new Date();
    const localOffset = data.timezone + today.getTimezoneOffset() * 60
    const localDate = new Date(today.setUTCSeconds(localOffset))
    const options = { weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric' }
    const formattedDate = localDate.toLocaleDateString("en-US", options)
    this.dateTarget.innerText = formattedDate
  }
}
