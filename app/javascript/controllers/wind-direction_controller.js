import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "arrow",  ]

  connect() {
    var direction = parseInt(this.arrowTarget.getAttribute("Value").slice(0,-1))
    direction = String(direction + 175)

    this.arrowTarget.style.webkitTransform = `rotate(${direction}deg)`;
  }

}
