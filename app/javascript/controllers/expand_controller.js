import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "hide", 'expandButton' ]

  connect() {
    console.log("hello");
  };

  expand() {
    this.hideTargets.forEach((item) => {
      item.classList.remove("hidden");
    });
    this.expandButtonTarget.classList.add('hidden');
  };
};
