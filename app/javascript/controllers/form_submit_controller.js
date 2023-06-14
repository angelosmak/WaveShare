import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {
  submit() {
    console.log("I am in Submit Method")
    this.element.submit();
  }
}
