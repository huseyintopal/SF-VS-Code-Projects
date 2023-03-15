import { api, LightningElement } from 'lwc';

export default class CalendlyLWC extends LightningElement {

    @api calendlyLink;
    @api leadId;
    @api leadName;
    @api leadEmail;


    connectedCallback(){
        console.log('this.calendlyLink');
        console.log(this.calendlyLink);

        this.calendlyLink=this.calendlyLink.replaceAll('%2F','/').replaceAll('%3A',':');
        console.log(this.calendlyLink);
        let name = '?name=' + this.leadId+' '+this.leadName;
        let email= '&email='+this.leadEmail;
        this.calendlyLink+=name+email;



        /*this.calendlyLink=this.calendlyLink.replaceALL('%2F','/').replaceALL('%3A',':');
        console.log(this.calendlyLink);*/



        //https://calendly.com/huseyin05topal/cw-randevu-demo
        //https%3A%2F%2Fcalendly.com%2Fhuseyin05topal%2Fcw-randevu-demo
        //https%3A%2F%2Fcalendly.com%2Fhuseyin05topal%2Fcw-randevu-demo
    }






}