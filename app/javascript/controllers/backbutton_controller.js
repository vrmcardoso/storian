import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];

  connect() {
    this.instanceID = Math.random();
    console.log(`Back button controller initialized (ID: ${this.instanceID})`);

    if (window.history.length > 1) {
      this.buttonTarget.style.display = "inline-block";
    } else {
      this.buttonTarget.style.display = "none";
    }
  }

  goBack() {
    console.log(`Back button clicked (ID: ${this.instanceID})`);
    window.history.back();
  }
}

