// checkboxes_controller.js
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["checkbox"];

  toggleColumn1(event) {
    this.toggleColumn(event, "1");
  }

  toggleColumn2(event) {
    this.toggleColumn(event, "2");
  }

  toggleColumn(event, column) {
    const clickedCheckbox = event.target;
    if (!clickedCheckbox.checked) return;

    const checkboxesInColumn = this.checkboxTargets.filter((checkbox) => {
      return checkbox.dataset.column === column && checkbox !== clickedCheckbox;
    });

    checkboxesInColumn.forEach((checkbox) => {
      checkbox.checked = false;
    });
  }
}
