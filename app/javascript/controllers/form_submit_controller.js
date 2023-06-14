import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-submit"
export default class extends Controller {
  connect() {
    console.log("hello from connect")
    console.log(this.element)
  }
  submit() {
    console.log("I am in Submit Method")
    this.element.submit();
  }
}
