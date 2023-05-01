import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["worldSelect", "seriesSelect"];

  connect() {
    this.updateSeriesSelect();
  }

  updateSeriesSelect() {
    const worldId = this.worldSelectTarget.value;
    const seriesSelect = this.seriesSelectTarget;
    const userId = this.data.get("userId");

    if (worldId) {
      fetch(`/users/${userId}/books/find_series?world_id=${worldId}`)
        .then((response) => response.json())
        .then((data) => {
          seriesSelect.innerHTML = "<option>Select a Series</option>";
          const standaloneOption = document.createElement("option");
          standaloneOption.value = "";
          standaloneOption.text = "Stand-alone (no series)";
          seriesSelect.add(standaloneOption);
          data.forEach((series) => {
            const option = document.createElement("option");
            option.value = series.id;
            option.text = series.name;
            seriesSelect.add(option);
          });
          seriesSelect.disabled = false;
        });
    } else {
      seriesSelect.innerHTML = "<option>Select a World first</option>";
      seriesSelect.disabled = true;
    }
  }
}
