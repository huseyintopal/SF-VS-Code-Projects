import { LightningElement, api } from 'lwc';

export default class CalendlyLWC extends LightningElement {

    @api calendlyLink;


    connectedCallback(){
        console.log('This link yuzdeli');
        console.log(this.calendlyLink);
       
    

        this.calendlyLink=this.calendlyLink.replaceAll('%3A',':');
        this.calendlyLink=this.calendlyLink.replaceAll('%2F','/');

        console.log('This link duzeltildi');
        console.log(this.calendlyLink);


        //https%3A%2F%2Fcalendly.com%2Fharrysfthomas%2F30min
        //https://calendly.com/harrysfthomas/30min

    }
}