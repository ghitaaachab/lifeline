import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="medicalfile-form"

export default class extends Controller {
  static targets = ["modal", "addmedicalfilebtn", "newmedicalfile", "qrcode", "qrcodebtn"];

  connect() {}

  showform() {
    this.newmedicalfileTarget.classList.toggle("d-none");
    this.form.classList.toggle("shown");
  }

  showImage() {
    this.modalTarget.classList.toggle("d-none");
  }

  showQrcode(e){
    e.currentTarget.querySelector('.qrcodeimg').classList.toggle('d-none');
  }
}
