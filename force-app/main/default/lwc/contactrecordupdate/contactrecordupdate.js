import { LightningElement,api } from 'lwc';

import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import MOBILE_FIELD from '@salesforce/schema/Contact.MobilePhone';
import NAME_FIELD from '@salesforce/schema/Contact.Name';

export default class Contactrecordupdate extends LightningElement {

      // The record page provides recordId and objectApiName
      @api recordId;
      @api objectApiName;
  
      fields = [EMAIL_FIELD, MOBILE_FIELD, NAME_FIELD];
  
      handleSubmit(event){
          event.preventDefault();       // stop the form from submitting
          const fields = event.detail.fields;
          fields.LastName = 'My Custom Last Name';// modify a field
          this.template.querySelector('lightning-record-form').submit(fields);
       }
}