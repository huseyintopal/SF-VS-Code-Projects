public class OpportunityHandler {
    public static void checkStage(List<Opportunity> triggerNew, List<Opportunity> triggerOld, 
                                  Map<Id, Opportunity> triggerOldMap,
                                  Map<Id, Opportunity> triggerNewMap){
                                      for(Opportunity o:triggerNew){
                                          if(o.StageName=='Prospecting' && triggerOldMap.get(o.id).stageName!='Prospecting'){
                                              o.StageName.adderror('You can not return Prospecting Stage again!...');
                                          }
                                      }
                                  }

}