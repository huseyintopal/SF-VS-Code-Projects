import { LightningElement } from 'lwc';

export default class Testlwc extends LightningElement {

    titleText='Track Decorator Example'
    footerText='Cohort 3';

    titleChangeHandler(){
        console.log('Before Click');
        console.log(this.titleText);

        this.titleText='Button Clicked';

        console.log('After Click');
        console.log(this.titleText);
}
}