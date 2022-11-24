import { LightningElement, track, api,wire } from 'lwc';
import getById from '@salesforce/apex/AccountSelector.getById';

export default class AccountAddress extends LightningElement {
    @track mapMarkers = [];
    @track markersTitle = 'Account Address on Map';
    @track zoomLevel = 5;
    _recordId;

	@api get recordId() {
		return this._recordId;    
	}
	set recordId(value) {
        alert('value:'+value);
		if (value) {
			this._recordId=value;
		}
	}

    mapOptions = {
        'disableDefaultUI': true,
        'draggable': false, 
    };

    @wire(getById, { acctid: '$recordId'})
    wireContacts({ error, data }) {
        console.log('AccountAddress.data:'+JSON.stringify(data));
        console.log('AccountAddress.recordId:'+this.recordId);
       if (data) {
           var rec=data[0];
            this.mapMarkers = [
                {
                    location: {
                        City: rec.BillingCity,
                        Country: rec.BillingCountry,
                        PostalCode:rec.BillingPostalCode,
                        State:rec.BillingState,
                        Street:rec.BillingStreet
                    },
                    icon: 'custom:custom26',
                    title: rec.name,
                }                                    
            ];

            this.error = undefined;
        } else if (error) {
            this.error = error;
        }
    }
}