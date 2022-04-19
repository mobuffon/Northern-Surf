import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "hide", 'expandButton' ]

  connect() {

  };

  expand() {
    this.hideTargets.forEach((item) => {
      item.classList.remove("hidden");
    });
    this.expandButtonTarget.classList.add('hidden');
  };
};
