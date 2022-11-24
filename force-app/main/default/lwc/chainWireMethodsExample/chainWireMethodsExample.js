import { LightningElement, wire } from 'lwc';
import { getPicklistValuesByRecordType, getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';


export default class ChainWireMethodsExample extends LightningElement {
    recordTypeId;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    handleResult({error, data}) {
        if(data) {
            console.log('object info: ' + JSON.stringify(data))
            this.recordTypeId = data.defaultRecordTypeId;
        } else {
            console.log('Get object info Error: ' + JSON.stringify(error))
        }
    }

    /**
     * Retrieve picklist values based on record type
     * 
     * @param error
     * @param data
     */
    @wire(getPicklistValuesByRecordType, { objectApiName: ACCOUNT_OBJECT, recordTypeId: '$recordTypeId' })
    wiredPicklistValues({error, data}) {
        if(data){
            console.log('Picklist Data: ' + JSON.stringify(data))
            //handle picklist values
        }else{
            console.log('Get picklist values Error: ' + JSON.stringify(error))
        }
    }


}