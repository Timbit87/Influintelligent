// app/javascript/controllers/submission_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "button", "btnClassList"]

  toggle(event) {
    event.preventDefault();
    this.formTarget.classList.toggle('d-none');
    this.buttonTarget.innerText = this.formTarget.classList.contains('d-none') ? 'Submit for Collaboration' : 'Close Form';
    this.btnClassListTarget.classList.toggle('card-button');
    this.btnClassListTarget.classList.toggle('disable-btn-form');
  }
}
