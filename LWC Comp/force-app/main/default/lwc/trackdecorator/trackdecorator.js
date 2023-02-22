import { LightningElement, track } from 'lwc';

export default class Trackdecorator extends LightningElement {
    @track cardText = {// Track ifadesi olmazsa sayfa render etmiyor arka planda degisim olsada UI da sayfa guncellemiyor!
        title : 'Object Track Decorator Example',
        body : 'Object Card body Track Decorator',
        footer : 'Object Card Footer Example'
    }

    titleChangeHandler(){
        console.log('Before Click');
        //console.log(this.cardText);
        console.log(JSON.stringify(this.cardText));
        this.cardText.title = 'Title Button clicked';
        this.cardText.body = 'Body Button clicked';
        this.cardText.footer = 'Footer Button clicked';

        //Yontem 2:Objeyi butun olarakda koyabiliriz!
        /*this.cardText = {
            title : 'Object Track Decorator Button Click',
            body : 'Object Card body Track Decorator Button Click',
            footer : 'Object Card Footer Example Button Click'
        }*/

        console.log('After Click');
        //console.log(this.cardText);
        console.log(JSON.stringify(this.cardText));
    }

}