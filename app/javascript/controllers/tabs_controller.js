// import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
// export default class extends Controller {
//   connect() {
//     console.log("Hello, Stimulus!")
//   }
//   openCity(event) {
//     console.log(event)
//     var i, tabcontent, tablinks;
//     tabcontent = document.getElementsByClassName("tabcontent");
//     for (i = 0; i < tabcontent.length; i++) {
//       tabcontent[i].style.display = "none";
//     }
//     tablinks = document.getElementsByClassName("tablinks");
//     for (i = 0; i < tablinks.length; i++) {
//       tablinks[i].className = tablinks[i].className.replace(" active", "");
//     }
//     document.getElementById(cityName).style.display = "block";
//     evt.currentTarget.className += " active";
//   }
// }
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hideable" ]

  showTargets() {
    this.hideableTargets.forEach(el => {
      el.hidden = false
      console.log("show")
    });
  }

  hideTargets() {
    this.hideableTargets.forEach(el => {
      el.hidden = true
      console.log("hide")
    });
  }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    });
  }
}

