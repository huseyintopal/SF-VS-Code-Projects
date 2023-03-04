import { LightningElement,api } from 'lwc';
export default class Randevu extends LightningElement {
  @api calendlyLink;
  // calendlyLink=https://calendly.com/alex_victor/cw-demo-randevu
  // https%3A//calendly.com/Falex_victor/Fcw-demo-randevu
  connectedCallback(){
    console.log('this.calendlyLink');
 
    console.log(this.calendlyLink);
    this.calendlyLink=this.calendlyLink.replaceAll('%2F','/').replaceAll('%3A',':');
    console.log(this.calendlyLink);
  }
}