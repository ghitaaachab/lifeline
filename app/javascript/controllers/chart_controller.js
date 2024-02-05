import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chart"
export default class extends Controller {
  static values = {
    vs: String,
    label: String
  }
  connect() {
    const ctx = this.element
    console.log(JSON.parse(this.vsValue));

  new Chart(ctx, {
    type: 'line',
    data:  {
      labels: ["Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"],
      datasets: [{
        label: this.labelValue,
        data: JSON.parse(this.vsValue),
        fill: false,
        borderColor: 'rgb(75, 192, 192)',
        tension: 0.1
      }]
    }
  });
  }
}
