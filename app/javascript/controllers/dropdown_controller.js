// app/javascript/controllers/dropdown_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["menu"];

  initialize() {
    this.hideDropdown = this.hideDropdown.bind(this);
  }

  connect() {
    document.addEventListener("DOMContentLoaded", () => {
      document.addEventListener("click", this.hideDropdown);
    });
  }

  disconnect() {
    document.removeEventListener("click", this.hideDropdown);
  }

  toggle(event) {
    event.preventDefault();
    event.stopPropagation();
    this.menuTarget.classList.toggle("show");
  }

  hideDropdown() {
    this.menuTarget.classList.remove("show");
  }
}

