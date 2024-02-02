import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="medicalfile-form"

export default class extends Controller {
  static targets = ["newmedicalfile", "addmedicalfilebtn"]

  connect() {
    console.log("Test");
  }

  showform(){
    this.newmedicalfileTarget.classList.toggle("d-none");
  }
}
