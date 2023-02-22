import { api, LightningElement } from 'lwc';

export default class ContactEditWithAPIs extends LightningElement {
    @api recordId;    //003Dn000009k2DmIAI
    @api objectApiName;   //Contact
    fields=["AccountId", "Name", "Title", "Phone", "Email"]
}

//https://ddn000002ousrmau-dev-ed.develop.lightning.force.com/lightning/r/Contact/003Dn000009k2DmIAI/view