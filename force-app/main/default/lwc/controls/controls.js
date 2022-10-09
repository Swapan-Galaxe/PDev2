import { LightningElement } from 'lwc';

export default class Controls extends LightningElement {
    handleAdd() {  
        //alert('9');
        this.dispatchEvent(new CustomEvent('add'));
      
      }
      handleSubtract() {
        this.dispatchEvent(new CustomEvent('subtract'));
      }
}