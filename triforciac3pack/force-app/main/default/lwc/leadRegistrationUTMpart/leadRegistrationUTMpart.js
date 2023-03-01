import { LightningElement,api,track } from 'lwc';
import NAME from '@salesforce/schema/Lead.Name';
import EMAIL from '@salesforce/schema/Lead.Email';
import PHONE from '@salesforce/schema/Lead.Phone';
import ADDRESS from '@salesforce/schema/Lead.Address';
import COMPANY from '@salesforce/schema/Lead.Company';
import INFO from '@salesforce/schema/Lead.Info_Session_Date_Time__c';
import INTERESTED from '@salesforce/schema/Lead.Interested_Path__c';

import retrieveCourse from '@salesforce/apex/GuestUserController.retrieveCourse';

import retrieveCampaign from '@salesforce/apex/GuestUserController.retrieveCampaign';
import createAd from '@salesforce/apex/GuestUserController.createAd';
import createCampaignMember from '@salesforce/apex/GuestUserController.createCampaignMember';


//retrieve icin wire veya imperative method kullanilabilir burda imperative kullandik!

export default class NewLeadRegistration extends LightningElement {
 // Expose a field to make it available in the template
fields = [
NAME,
EMAIL,
PHONE,
ADDRESS,
COMPANY,
INFO,
INTERESTED
];
name=NAME;
email=EMAIL;
phone=PHONE;
address=ADDRESS;
company=COMPANY;
info=INFO;
interested=INTERESTED;

isLeadSent=false;
loading=false;

value = 'inProgress';
companyName='xx';
/*
options = [
  { label: 'New', value: 'new' },
  { label: 'In Progress', value: 'inProgress' },
  { label: 'Finished', value: 'finished' },
];
*/
@track options = [];

startDate;
 // Flexipage provides recordId and objectApiName
@api recordId; //LEad Id olmasi beklenen yer
@api objectApiName='Lead';

//api decaratorler
@api utm_source;
@api utm_medium;
@api utm_campaign;
@api utm_id;
@api utm_term;
@api utm_content;
@api utm_referer;



clickhandler(){
  this.loading=true;
setTimeout(() => {
  this.isLeadSent=true;
  this.loading=false;
}, 3000);
}

handleChange(event) {
    this.value = event.detail.value;
     //array filter array forEach ve array map iyi ogrenmek lazim
     // console.log(JSON.parse(JSON.stringify(event.detail)));
    
    let selectedOption=this.options.filter(option=>option.value==event.detail.value);
    
    //console.log(JSON.parse(JSON.stringify(selectedOption)));
    this.companyName=selectedOption[0].label;
    this.startDate = selectedOption[0].StartDate;
}

connectedCallback(){
  retrieveCourse()
  .then(multicourse=>{
    multicourse.forEach(course => {
      
      this.options=[
        ...this.options,
        { 
          label: course.Name, 
          value: course.Id,
          StartDate:course.Start__c
      
        }
      ];
    });
  })
  .catch(err=>{
    console.log(err);
  });
}
}
