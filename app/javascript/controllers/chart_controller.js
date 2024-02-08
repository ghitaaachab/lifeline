import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="chart"
export default class ChartController extends Controller {
  static values = {
    vs: String, // Data values for the chart
    label: String, // Chart label
    chartColors: String, // Optional JSON string for initial color configuration
    chartWidth: Number, // Optional width in pixels (default: 300)
    chartHeight: Number, // Optional height in pixels (default: 200)
  };

  connect() {
    const ctx = this.element;

    // Create an initial Chart.js instance
    this.chart = new Chart(ctx, {
      type: "line",
      data: {
        labels: [
          "Lundi",
          "Mardi",
          "Mercredi",
          "Jeudi",
          "Vendredi",
          "Samedi",
          "Dimanche",
        ],
        datasets: [
          {
            label: this.labelValue,
            data: JSON.parse(this.vsValue),
            fill: false, // Adjust as needed
            borderColor: "#002162bb", // Use colors from `chartColors` if available
            tension: 0.1, // Or other styling options from `chartColors`
          },
        ],
      },
      options: {
        backgroundColor: "white",
        responsive: false, // Prevent automatic resizing
        width: 800, // Apply custom width
        height: 800, // Apply custom height
      },
    });

    // Apply initial styling from `chartColors` (if provided)
    if (this.hasChartColorsValue) {
      this.updateChartColors();
    }
  }

  updateChartColors() {
    // Parse color configuration from `chartColors`
    const colorConfig = JSON.parse(this.chartColorsValue);

    // Update chart with custom styles
    if (colorConfig.borderColor) {
      this.chart.defaults.borderColor = "white";
    }
    // Update other styling options as needed based on `colorConfig`

    // Trigger chart update
    this.chart.update();
  }
}
