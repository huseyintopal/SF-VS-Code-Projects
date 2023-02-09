@isTest
public class LeadTest {
    
    @testSetup
    public static void setup(){ //Factory setting
        //Prepare Data
        List<Lead> testLeads = New List<Lead>();
        
        for(Integer x=1;x<=100;x++){     // no phone....
            Lead slead = New Lead();
            
            slead.FirstName = 'test ' + x;
            slead.LastName = 'test ' + x;
           
            slead.Company= 'testCompany ' + x;
            testLeads.add(slead);
            
            
        } 
        for(Integer x=1;x<=100;x++){
            Lead slead = New Lead();
            
            slead.FirstName = 'test ' + x;
            slead.LastName = 'test ' + x;
            slead.phone = '222222222';
            slead.Company= 'testCompany ' + x;
            testLeads.add(slead);
            
            
        }    
                
        insert testLeads;
        
        // Trigger Run (LeadTrigger) FirstName,LastName,Company text Case Uppercase.
     
    }
    @isTest
    public static void leadTest1(){
        //is there any Task records....
        
        List<Lead> testLead = [Select id, FirstName, LastName, Phone, Company, 
                               (Select id,Subject,WhoId,Status,ActivityDate,IsReminderSet,OwnerId,ReminderDateTime 
                                FROM Tasks) 
                               FROM Lead];
        
        integer countTask = 0;
        
        for(Lead singleLead:testLead){  //toplamda 100 phone lu 100 phone suz 200 Lead var
            if(singleLead.tasks.size() !=0){
                countTask++;
            }
            
        }
        System.debug('Total Lead : '+ testLead.size());
        System.debug('How Many Task Created : ' + countTask);
        System.assertEquals(200,testLead.size());
		System.assertEquals(100,countTask);
    }

}