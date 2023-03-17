@RestResource(urlMapping='/Zoom/Webhook/*')
global class ZoomWebService {
    @HttpGet
    global static string getHandler(){
        return 'Hello Zoom Service';
    }
    //body__c
    //event__c
    //zoomlog__c
    
    @HttpPost
    global static void postHandler(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        
        Map<String,Object> eventMap = (Map<String,Object>) JSON.deserializeUntyped(req.requestBody.toString());
        
        Map<String,Object> payloadMap = (Map<String,Object>) eventMap.get('payload');
        
        Map<String,Object> ObjectMap = (Map<String,Object>) payloadMap.get('object');
        
        String eventtype = eventMap.get('event').toString();
        
        
        
        zoomlog__c zoomlog = New zoomlog__c();
        zoomlog.body__c=req.requestBody.toString();
        zoomlog.event__c=eventtype; // yeni hali
        //zoomlog.event__c=eventMap.get('event').toString(); eski hali
        
        insert zoomlog;
        
        switch on eventtype{
            when 'meeting.created' {	// when block 1
               	String ZoomURL = ObjectMap.get('join_url').toString();
                String Topic = ObjectMap.get('topic').toString();
                String start_time = ObjectMap.get('start_time').toString();
                
                Id intId = Topic.split('\\$')[0];
                
                zoomlog__c createLog = New zoomlog__c();
        		zoomlog.body__c=ZoomURL;
        		zoomlog.event__c=Topic;
                insert createLog;
                
                //zoom dan     = 2023-03-17T13:30:00Z
                
                //infoDate  JS = 2023-03-01T20:26:00.000Z
        	  //Datet Apex info= yyyy-MM-dd HH:mm:ss
        	  //start_time= start_time.replace(target, replacement);
                
                start_time= start_time.replace('T', ' ');
                
                Datetime zoomTime=Datetime.valueOf(start_time);
                
                
                if(String.valueOf(intId.getSObjectType())=='Interview__c'){
                    Interview__c interview = New Interview__c();
                    interview.id=intId;
                    interview.Meeting_URL__c=ZoomURL;
                    interview.Scheduled_DateTime__c=zoomTime;
                    interview.Status__c='Scheduled';
                    update interview;
                }
            }
                
                when 'meeting.deleted'{		// when block 2
                    String TopicDelete = ObjectMap.get('topic').toString();
                }
                
                when 'endpoint.url_validation' {		// when block 3
                    reqData reqApex = (reqData)JSON.deserialize(req.requestBody.toString(), reqData.class);
                    resData resData = New resData();
                    
                    String encryptedToken='';
                    
                    
                    zoomlog__c zoomverify = New zoomlog__c();
                    zoomverify.body__c=req.requestBody.toString();
                    zoomverify.event__c=reqApex.event; 
                    
                    insert zoomverify; 
                    
                    Blob webhookToken = Blob.valueOf('BlJqsXqFSyGx2pivXo23gg');
                    Blob plainToken = Blob.valueOf(reqApex.payload.plainToken);
                    
                    Blob hmac = Crypto.generateMac('HmacSHA256', plainToken, webhookToken);
                    
                    encryptedToken=EncodingUtil.convertToHex(hmac);
                    
                    resData.plainToken = reqApex.payload.plainToken;
                    resData.encryptedToken = encryptedToken;
                    
                    res.statusCode=200;
                    res.addHeader('Content-Type', 'application/json');
                    res.responseBody=Blob.valueOf(JSON.serialize(resData));
                    
                }
                when else {		  // default block, optional
                    
                }
            
            
        }
        }
        
        global class reqData{
            global payload payLoad;
            global string event_ts;
            global String event;
            
        }
        
        global class payLoad{
            Global String plainToken;
            
        }
        global class resData {
            Global String plainToken;
            Global String encryptedToken;
        }
        
    }
    
    




//webhook request body
/*{
"payload": {
"plainToken": "zgtz4qcrSeul2RNOIFKQ1Q"
},
"event_ts": 1678822201821,
"event": "endpoint.url_validation"
}

encryptedToken:
{
"plainToken": "qgg8vlvZRS6UYooatFL8Aw",
"encryptedToken": "23a89b634c017e5364a1c8d9c8ea909b60dd5599e2bb04bb1558d9c3a121faa5"
}*/
//
//
//
//
//normal callout URLintehration user
//https://schoolpackage-dev-ed.develop.my.salesforce.com/     /Zoom/Webhook/
//
////guest User.VF Page Webhook
//https://schoolpackage-dev-ed.develop.my.salesforce-sites.com/services/apexrest/Zoom/Webhook/
//
//Zoom API Info
//
//Client ID: MRG17AC4S5eEByF_QOyRdw    
//Client secret: gqwrIwCzhFocZf0cLn6RGCPSxwJ8G7yC
// https://zoom.us/oauth/authorize
// https://zoom.us/oauth/token
// Callback URL: https://schoolpackage-dev-ed.develop.my.salesforce.com/services/authcallback/zoom
// 
//WebHook Token Secret Token: BlJqsXqFSyGx2pivXo23gg
//Verification Token (Retires in October 2023): xKV2zzMORTCnBlH7UDdldQ