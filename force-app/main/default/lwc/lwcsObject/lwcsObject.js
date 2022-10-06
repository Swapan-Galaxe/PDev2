import { LightningElement,api, track } from 'lwc';
 
export default class LwcsObject extends LightningElement {
    @api sobject;
    @api fieldName;
    @track data = '';

    renderedCallback() {
        if(!this.fieldName.includes('.')) {
            this.data = this.sobject[this.fieldName];
        }
        else {
            this.data = this.sobject[this.fieldName.split(".")[0]][this.fieldName.split(".")[1]]; //Here we are fetching data from parent field
        }
    }
}