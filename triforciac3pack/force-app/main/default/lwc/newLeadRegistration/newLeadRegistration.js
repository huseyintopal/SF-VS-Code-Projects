import { LightningElement,api } from 'lwc';
import NAME from '@salesforce/schema/Lead.Name';
import EMAIL from '@salesforce/schema/Lead.Email';
import PHONE from '@salesforce/schema/Lead.Phone';
import ADDRESS from '@salesforce/schema/Lead.Address';
import INFO from '@salesforce/schema/Lead.Info_Session_Date_Time__c';
import COMPANY from '@salesforce/schema/Lead.Company';
import INTERESTED from '@salesforce/schema/Lead.Interested_Path__c';

import retrieve from '@salesforce/apex/UIcourseController.retrieve';





export default class NewLeadRegistration extends LightningElement {

 // Expose a field to make it available in the template
 fields = [
NAME,
EMAIL,
PHONE,
ADDRESS,
INFO,
COMPANY,
INTERESTED
 ];
 name=NAME;
 email=EMAIL;
 phone=PHONE;
 address=ADDRESS;
 info=INFO;
 company=COMPANY;
 interested=INTERESTED;

 isLeadSent=false;

 value = 'inProgress';

    get options() {
        return [
            { label: 'New', value: 'new' },
            { label: 'In Progress', value: 'inProgress' },
            { label: 'Finished', value: 'finished' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }

 // Flexipage provides recordId and objectApiName
 @api recordId;
 @api objectApiName='Lead';

clickhandler(){
    this.isLeadSent=true;
}

setTimeout(() => {
    this.isLeadSent=true;
    
}, 3000);

connectedCallback(){
    retrieve()
    .then(multicourse => {
        multicourse.forEach(course => {
            this.options=[
                ...this.options,
                {
                    label: course.name,
                    value: course.Id
                }
            ];
        }
    })
}


}