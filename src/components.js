import katex from 'katex';
import "katex/dist/katex.min.css";

// Define a custom element that renders LaTeX through katex
class Katex extends HTMLElement {
  constructor() {
    super();

    this._expression = '';
    this._options = {};
  }

  connectedCallback() {
    this.render();
  }

  get expression() {
    return this._expression;
  }

  set expression(value) {
    if (value === this._expression) return;

    this._expression = value;
    this.render();
  }
  
  render() {
    this.innerHTML = katex.renderToString(this._expression, this._options);
  }

}

export class MathInline extends Katex {
  constructor() {
    super()

    this._options = { throwOnError: false, displayMode: false };
  }
}

export class MathBlock extends Katex {
  constructor() {
    super()

    this._options = { throwOnError: false, displayMode: true };
  }
}
