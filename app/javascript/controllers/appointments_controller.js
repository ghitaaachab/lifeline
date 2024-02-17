import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "xmodal", "close" ]

  connect() {
    console.log("yeyt");
  }

  load() {
      this.xmodalTarget.classList.remove("d-none")
  }

  close(){
    console.log('aa')
    this.xmodalTarget.classList.add("d-none")
  }

}
