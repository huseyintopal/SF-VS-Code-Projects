trigger LeadTrigger on Lead (before insert, before update, before delete, 
                             after insert, after update, after delete, after undelete) {
                                 
                                 //System.debug('LeadTrigger is running .... ' + Trigger.OperationType);
                                 
                                 List<Task> multiTask = New List<Task>(); 
                                 
                                 
                                 
                                 
                                 switch on Trigger.OperationType{
                                     when BEFORE_INSERT {}
                                     when BEFORE_UPDATE {}
                                     when BEFORE_DELETE {} 
                                     
                                     when AFTER_INSERT {
                                         
                                         //bulkification.... Trigger.new = List<Lead>
                                         
                                         //List<Task> multiTask = New List<Task>(); //Bunu yukariya aldik iki yerde de olur
                                         
                                         
                                         for(Lead singleLead:Trigger.New){
                                             
                                             if(String.isBlank(singleLead.phone)){
                                                 //Create Task...
                                                 Task singleTask = New Task();
                                                 singleTask.Subject = 'Update Phone Number .....';
                                                 singleTask.ActivityDate = date.TODAY()+10;
                                                 singleTask.WhoId = singleLead.id; // Lead ID .... 
                                                 singleTask.OwnerId = singleLead.OwnerId;
                                                 singleTask.Status = 'Not Started';
                                                 singleTask.IsReminderSet = True;
                                                 
                                                //Notification da Bell calmasi icin ekledik Page layout
                                                 singleTask.ReminderDateTime = Date.TODAY(); 
                                                 
                                                 
                                                 
                                                 multiTask.add(singleTask);                                       
                                                 
                                             }
                                         }
                                         
                                         insert multiTask;                                         
                                         
                                         
                                         
                                         
                                     }/*
                                     when AFTER_UPDATE {}
                                     when AFTER_DELETE {}
                                     
                                     when AFTER_UNDELETE {}*/
                                 }
                                 
                                 
                             }