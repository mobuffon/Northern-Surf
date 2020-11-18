// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    var windpower = parseInt(this.outputTarget.textContent)
    if (windpower > 45) {
      this.outputTarget.setAttribute("style", "background-color:red;");
    }else if (windpower > 24) {
      this.outputTarget.setAttribute("style", "background-color: #73F64A;");
    }else if (windpower > 17) {
      this.outputTarget.setAttribute("style", "background-color: #62D141;");
    }else if (windpower > 13) {
      this.outputTarget.setAttribute("style", "background-color: #5DBE95;");
    }else if (windpower > 10) {
      this.outputTarget.setAttribute("style", "background-color: #5AC4FA;");
    }else if (windpower = 10) {
      this.outputTarget.setAttribute("style", "background-color: #4294F7;");
    }else {
      this.outputTarget.setAttribute("style", "background-color: #2962F6;");
    }
  }
}
