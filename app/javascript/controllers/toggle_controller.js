import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["myTable", "myTable2", "myTable3", "myTable4"];



  fire(event) {
    const table = this.myTableTarget;
    this.#closeTables();
    table.classList.toggle("d-none");
  }

  fire2(event) {
    const table = this.myTable2Target;
    this.#closeTables();
    table.classList.toggle("d-none");
  }

  fire3(event) {
    const table = this.myTable3Target;
    this.#closeTables();
    table.classList.toggle("d-none");
  }

  fire4(event) {
    const table = this.myTable4Target;
    this.#closeTables();
    table.classList.toggle("d-none");
  }
  #closeTables() {
    const tables = document.querySelectorAll("table");
    tables.forEach((table) => {
      table.classList.add("d-none");
    });
}

}
