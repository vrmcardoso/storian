import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log("Stimulus controller connected");

    this.carouselElement = document.querySelector(".background-carousel");

    if (!this.carouselElement) {
      console.error("Carousel element not found");
      return;
    }

    this.backgrounds = ["background-1", "background-2", "background-3", "background-4", "background-5", "background-6", "background-7", "background-8", "background-9"];
    this.currentBackground = 0;
    this.changeBackground();
    this.interval = setInterval(() => this.changeBackground(), 10000);
  }

  disconnect() {
    clearInterval(this.interval);
  }

  changeBackground() {
    console.log("Changing background");

    this.carouselElement.classList.remove(...this.backgrounds);
    this.currentBackground = (this.currentBackground + 1) % this.backgrounds.length;
    this.carouselElement.classList.add(this.backgrounds[this.currentBackground]);
  }
}
