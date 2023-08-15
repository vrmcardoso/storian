import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.modal = document.getElementById('add-map-modal');
  }

  open() {
    event.preventDefault();
    this.modal.style.display = "block";
  }

  close() {
    this.modal.style.display = "none";
  }
}
