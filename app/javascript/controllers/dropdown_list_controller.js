import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    this.hideAllMenus();
  }

  showMenu(event) {
    const targetMenu = event.target.getAttribute("data-dropdown-list-target");
    const menu = this.menuTargets.find(menu => menu.getAttribute("data-dropdown-list-target") === targetMenu);

    this.hideAllMenus();
    menu.style.display = "block";
  }

  hideMenu(event) {
    const targetMenu = event.target.getAttribute("data-dropdown-list-target");
    const menu = this.menuTargets.find(menu => menu.getAttribute("data-dropdown-list-target") === targetMenu);

    menu.style.display = "none";
  }

  hideAllMenus() {
    this.menuTargets.forEach(menu => menu.style.display = "none");
  }
}
