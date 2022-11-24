import { LightningElement,wire } from 'lwc';
import getAccount from '@salesforce/apex/AccountSelector.getAccount';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Website', fieldName: 'Website', type: 'url' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email__c', type: 'email' }
];

export default class AccountSelector extends LightningElement {
    columns=columns;
    contacts;
    error;
    @wire(getAccount)
    wireContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
    handleRowSelection = event => {
        var selectedRows=event.detail.selectedRows;
        const itemSelected=new CustomEvent("itemselected", {
            detail: {
                recordId: selectedRows[0].Id
            }
        });
        this.dispatchEvent(itemSelected);
    }
}