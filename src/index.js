import { MathInline, MathBlock } from './components.js';
import { Elm } from './Main.elm';


customElements.define('math-inline', MathInline);
customElements.define('math-block', MathBlock);

const app = Elm.Main.init({
    node: document.getElementById('app')
});
