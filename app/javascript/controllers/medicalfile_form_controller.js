import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="medicalfile-form"

export default class extends Controller {
  static targets = ["modal", "addmedicalfilebtn", "newmedicalfile", "qrcode", "qrcodebtn"];

  connect() {}

  showform() {
    this.newmedicalfileTarget.classList.toggle("d-none");
    this.form.classList.toggle("shown");
  }

  showImage(e) {
    let allBigImages = document.querySelectorAll('.bigImg');
    allBigImages.forEach((img) => {
      if (!img.classList.contains('d-none')){
        img.classList.add('d-none');
      }
    })
    this.modalTarget.classList.toggle('d-none')
    window.scrollTo(0, 0);
    console.log(x);
  }

  showQrcode(e){
    e.currentTarget.querySelector('.qrcodeimg').classList.toggle('d-none');
  }
}
