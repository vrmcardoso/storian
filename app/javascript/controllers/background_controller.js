import { Controller } from "stimulus";

export default class extends Controller {
  initialize() {
    this.changeBackground = this.changeBackground.bind(this);
    this.startCarousel = this.startCarousel.bind(this);
  }

  connect() {
    this.startCarousel();
    document.addEventListener("turbo:load", this.startCarousel);
  }

  disconnect() {
    document.removeEventListener("turbo:load", this.startCarousel);
    clearInterval(this.interval);
  }

  startCarousel() {
    this.carouselElement = document.querySelector(".background-carousel");

    if (!this.carouselElement) {
      return;
    }

    this.backgrounds = [
      "background-1",
      "background-2",
      "background-3",
      "background-4",
      "background-5",
      "background-6",
      "background-7",
      "background-8",
      "background-9",
      "background-10",
      "background-11",
      "background-12",
      "background-13",
    ];
    this.currentBackground = 0;
    this.changeBackground();
    clearInterval(this.interval); // Clear any existing interval to avoid duplication
    this.interval = setInterval(this.changeBackground, 10000);
  }

  changeBackground() {
    this.carouselElement.classList.remove(...this.backgrounds);
    this.currentBackground =
      (this.currentBackground + 1) % this.backgrounds.length;
    this.carouselElement.classList.add(
      this.backgrounds[this.currentBackground]
    );
  }
}

