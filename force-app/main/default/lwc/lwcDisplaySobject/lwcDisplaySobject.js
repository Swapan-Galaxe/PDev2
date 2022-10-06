import { LightningElement, wire, track } from 'lwc';
import getsObjectDetails from '@salesforce/apex/LwcMapIterationController.getsObjectDetails';

export default class LwcDisplaySobject extends LightningElement {
    @track dySobject= [];
    @wire(getsObjectDetails, { objName: 'Account' })
    wiredResult(result) { 
        if (result.data) {
            //mapData = [];
            var conts = result.data;
            for(var key in conts){
                this.dySobject.push({value:conts[key], key:key}); //Here we are creating the array to show on UI.
            }
        }
    }
}