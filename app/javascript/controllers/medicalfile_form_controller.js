import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="medicalfile-form"

export default class extends Controller {
  static targets = ["modal", "addmedicalfilebtn", "newmedicalfile"];

  connect() {}

  showform() {
    this.newmedicalfileTarget.classList.toggle("d-none");
    this.form.classList.toggle("shown");
  }

  showImage() {
    this.modalTarget.classList.toggle("d-none");
  }

  showImage(){
    this.modalTarget.classList.toggle("d-none")
  }
}
