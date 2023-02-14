import { LightningElement, track } from 'lwc';

export default class HelloComponent extends LightningElement {

@track cardText = {
    title :'track Decorator Example',
    body : 'card body Track Decorator',
    footer : 'card Footer example'
}

    titleChangeHandler(){
        console.log('Before Click');
        console.log(JSON.stringify(This.cardText));
        this.cardText.title = 'Button clicked';
        console.log('After Click1');
        console.log(JSON.stringify(This.cardText));

    }


}