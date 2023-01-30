import { LightningElement, wire, api } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import getContentVersion from '@salesforce/apex/ContactController.getContentVersion';
import { refreshApex } from '@salesforce/apex';
import { updateRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ID_FIELD from '@salesforce/schema/Contact.Id';

const COLS = [
    {
        label: 'First Name',
        fieldName: FIRSTNAME_FIELD.fieldApiName,
        editable: true
    },
    {
        label: 'Last Name',
        fieldName: LASTNAME_FIELD.fieldApiName,
        editable: true
    },
    { label: 'Title', fieldName: TITLE_FIELD.fieldApiName, editable: true },
    {
        label: 'Phone',
        fieldName: PHONE_FIELD.fieldApiName,
        type: 'phone',
        editable: true
    },
    {
        label: 'Email',
        fieldName: EMAIL_FIELD.fieldApiName,
        type: 'email',
        editable: true
    },
    {
        label: 'View',
        type: 'button',
        initialWidth: 100,
        typeAttributes: { label: 'File', name: 'view_file', title: 'Click to View Details' }
    },
    {
        label: 'Download',
        type: 'button-icon',
        initialWidth: 100,
        typeAttributes: { iconName: 'utility:download', name: 'download_file', title: 'Click to download' }
    }
];

export default class ApexContactsEditForAccount extends NavigationMixin(LightningElement) {

    @api recordId;
    columns = COLS;
    draftValues = [];

    @wire(getContacts, { accId: '$recordId' })
    contacts;

    async handleSave(event) {
        // Convert datatable draft values into record objects
        const records = event.detail.draftValues.slice().map((draftValue) => {
            const fields = Object.assign({}, draftValue);
            return { fields };
        });

          // Clear all datatable draft values
          this.draftValues = [];

          try {
            // Update all records in parallel thanks to the UI API
            const recordUpdatePromises = records.map((record) =>
                updateRecord(record)
            );
            await Promise.all(recordUpdatePromises);

            // Report success with a toast
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contact/s updated',
                    variant: 'success'
                })
            );

            // Display fresh data in the datatable
            await refreshApex(this.contacts);
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating or reloading contacts',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        }
    }

    handleRowAction(event) {
        var action = event.detail.action;
        var row = event.detail.row;
        switch (action.name) {
            case 'view_file':
                this.navigateToFiles(row.Id);
                break;
            case 'download_file':
                this.downloadFile(row.Id);
                break;
            default:
                this.navigateToFiles(row.Id);
                break;
        }
    }
    
    navigateToFiles(id) {
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview'
            },
            state: {
                recordIds: id
            }
        });
    }
    
    downloadFile(id) {
        getContentVersion({ docId: id })
            .then((versionId) => window.open(`/sfc/servlet.shepherd/version/download/${versionId}`))
            .catch((error) => console.error('ERROR => ', error));
    }
}