import { LightningElement, api } from 'lwc';

export default class Comp1 extends LightningElement {

    @api itemName;

    greeting = 'World';

    handleChange(event) {
        this.greeting = event.target.value;
    }
}