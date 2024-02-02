import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  connect() {

function formatDate(date) {
  const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  const month = months[date.getMonth()];
  const day = date.getDate();
  const year = date.getFullYear();
  const hours = date.getHours();
  const minutes = date.getMinutes();

  return `${month} ${day}, ${year} ${hours}:${minutes}`;
}


  // Get current date and time
  const now = new Date();

  // Format date and time to February 1, 2024 16:46
  const formattedDateTime = now.toISOString().slice(0, 16);

  // Set placeholders for date-time inputs
  document.querySelector('#date-started').setAttribute('value', formattedDateTime);
  document.querySelector('#date-finished').setAttribute('value', formattedDateTime);


const button = document.querySelector('#submit');

button.addEventListener('click', function() {
  // Get current date and time
  const now = new Date();

  // Format date and time to February 1, 2024 16:46
  const formattedDateTime = now.toISOString().slice(0, 16);

  // Set placeholders for date-time inputs
  document.querySelector('#date-started').setAttribute('value', formattedDateTime);
  document.querySelector('#date-finished').setAttribute('value', formattedDateTime);
});
}
}
