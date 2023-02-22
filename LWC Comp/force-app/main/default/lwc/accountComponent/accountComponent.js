import { LightningElement, wire } from 'lwc';

import retrive from '@salesforce/apex/accountLWCController.retrive';

export default class AccountComponent extends LightningElement {

    //wire
    @wire(retrive) accounts;

    renderedCallback(){
        console.log(this.accounts);
    }

    //imperative
}