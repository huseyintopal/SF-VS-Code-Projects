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
        //calendly Token : eyJraWQiOiIxY2UxZTEzNjE3ZGNmNzY2YjNjZWJjY2Y4ZGM1YmFmYThhNjVlNjg0MDIzZjdjMzJiZTgzNDliMjM4MDEzNWI0IiwidHlwIjoiUEFUIiwiYWxnIjoiRVMyNTYifQ.eyJpc3MiOiJodHRwczovL2F1dGguY2FsZW5kbHkuY29tIiwiaWF0IjoxNjc4ODc0NDQ2LCJqdGkiOiJiZTFkNzJlOC1kMWRlLTRhZTYtOWMzYi1iNzA4NGJkNTAwNGQiLCJ1c2VyX3V1aWQiOiJERUFHN0lHN0dRNlhOUjRUIn0.Oaq5iuXRYDJbiRmb-PlCmnieM3azwLTewmoxNRxSeKf-BwDWRUPr_00ZYVL9IUHLBUJe-uJb5zcZj53EH52ecA

        //QULBUVQ2T2JBOQDSBMTJW47CZPDMUMOC
    }
//My Apps
//App_TestCohort3 was created;
//client ID: QLOKiHyq8J3CmDkJ1tb-2J8u0h8ZFpjqXubYJmD6XAk
//client screet: SfOCWg0KR7L68HPEx40FDABGT3sH4nxnD02v86Ak-Wc
//webhook signing key : 9dPR232OB142ScLq5DWeUjQCAmv3UFiTFAbhyg-gjCU




}