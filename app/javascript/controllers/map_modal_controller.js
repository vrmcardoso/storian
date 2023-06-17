import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button", "modal", "image"];

  connect() {
    console.log("MapModalController connected");
  }

  open(event) {
    console.log("Thumbnail clicked", event.currentTarget.dataset);
    const { mapUrl } = event.currentTarget.dataset;

    this.imageTarget.src = mapUrl;
    this.modalTarget.style.display = "block";
  }

  close() {
    this.modalTarget.style.display = "none";
  }
}
