import { LightningElement } from 'lwc';

export default class LWC1 extends LightningElement {
    name;
    changeHandler(event){
        this.name =event.target.value;

    }
    handleClick(){
        alert('Button clicked...')
    }




}