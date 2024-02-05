import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="medicalfile-form"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
  }

  showform(){
    this.newmedicalfileTarget.classList.toggle("d-none");
  }

  showImage(){
    this.modalTarget.classList.toggle("d-none")
  }
}
