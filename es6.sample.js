import Person from "People";

export default class Hulk extends Person {
  constructor(name) {
    super(name);
    this.hulkMode = false;
  }

  toggle() {
    this.hulkMode = !this.hulkMode;
  }

}
