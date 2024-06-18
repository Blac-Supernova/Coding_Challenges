global with sharing class ScheduleBatchDeleteChallenge implements Schedulable {
    global void execute(SchedulableContext sc) {
        BatchableChallenge b = new BatchableChallenge(); 
        Database.executeBatch(b);
    
    }
 
     
        // Initialize variable so that the schedulable method can call itself
     ScheduleBatchDeleteChallenge sb = new  ScheduleBatchDeleteChallenge();

       // CRON Expression to determine the time the code will run.
       String cronExpression = '0 0 0 1 1/1 ? *';
 
       
       String jobId = System.schedule('Monthly deletion of stale accounts', cronExpression, sb);
 
       // Finding scheduled job by jobID
       CronTrigger ct = 
       [SELECT TimesTriggered, NextFireTime 
       FROM CronTrigger 
       WHERE Id = :jobID];
}