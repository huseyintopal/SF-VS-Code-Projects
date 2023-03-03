import { LightningElement, api, track} from 'lwc';

import NAME from '@salesforce/schema/Lead.Name';
import EMAIL from '@salesforce/schema/Lead.Email';
import PHONE from '@salesforce/schema/Lead.Phone';
import ADDRESS from '@salesforce/schema/Lead.Address';
import COMPANY from '@salesforce/schema/Lead.Company';
import INFO from '@salesforce/schema/Lead.Info_Session_Date_Time__c';
import INTERESTED from '@salesforce/schema/Lead.Interested_Path__c';

//import retrieve from '@salesforce/apex/UIcourseController.retrieve';
 
import retrieveCourse from '@salesforce/apex/GuestUserController.retrieveCourse';

import createAd from '@salesforce/apex/GuestUserController.createAd';
import retrieveCampaign from '@salesforce/apex/GuestUserController.retrieveCampaign';
import createCampaignMember from '@salesforce/apex/GuestUserController.createCampaignMember';





export default class NewLeadRegFrom extends LightningElement {
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

        value = 'inProgress';
        companyName='xx';

        label1;
        /*
        get options() {
            return [
                { label: 'New', value: 'new' },
                { label: 'In Progress', value: 'inProgress' },
                { label: 'Finished', value: 'finished' },
            ];

            https://coursepackage3-dev-ed.develop.my.site.com/s/info-registration?utm_source=yahoo&utm_medium=tablet&utm_campaign=winterSale&utm_id=8888&utm_term=AWS+devops&utm_content=leadInfo
        }*/
       

        @track options = [];
        

    

//SELECT Id, Name, Cohort__c, End__c, Interview__c, Module__c, Start__c FROM Course__c
        // Flexipage provides recordId and objectApiName
        
        @api recordId;  //LEad Id burda olmali
        @api objectApiName='Lead';

        @api utm_source;
        @api utm_medium;
        @api utm_term;
        @api utm_content;
        @api utm_id;
        @api utm_campaign;
        @api utm_referer;

        clickHandler(){
            setTimeout(() => {
                this.isLeadSent=true;
            }, 3000);
        }


        connectedCallback(){
            retrieveCourse()
            .then(multicourse=>{

                multicourse.forEach(course=>{

                    this.options=[

                        ...this.options,

                        {
                            label:course.Name,
                            value:course.Id,
                            Label1:course.Start__c

                        }
    
                    ];


                });


        
            })
            .catch(err=>{
                console.log(err);
            })
        }




        /*
        connectedCallback(){
            retrieve()
            .then(multicourse=>{

                multicourse.forEach(course=>{

                    this.options=[

                        ...this.options,

                        {
                            label:course.Name,
                            value:course.Id,
                            Label1:course.Start__c

                        }
    
                    ];


                });


        
            })
            .catch(err=>{
                console.log(err);
            })
        }*/
        
        handleChange(event) {
            this.value = event.detail.value;

            //console.log(JSON.parse(JSON.stringify(event.detail)));

            let selectedOption=this.options.filter(singOption=>singOption.value==event.detail.value);
            console.log(JSON.parse(JSON.stringify(selectedOption)));

            this.companyName=selectedOption[0].label;
            this.label1=selectedOption[0].Label1;


        }

}