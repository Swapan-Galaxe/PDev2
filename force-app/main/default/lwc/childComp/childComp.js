import { LightningElement, track, api } from 'lwc';
export default class ChildComponent extends LightningElement {
    strtitle;
    @track Message;
    @api
    changeMessage(strString) {
         this.Message = strString.toUpperCase();
    }
}