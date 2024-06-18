public with sharing class BatchableChallenge implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext BC){
        // Create a query that selects the Account ID of stale accounts where all opportunities are closed and older than 6 months
        String query = 'Select Id from Account where Id NOT IN (SELECT AccountID FROM Opportunity WHERE isClosed = False) AND Id IN (SELECT AccountId FROM Opportunity WHERE IsClosed = TRUE AND CloseDate < LAST_N_MONTHS:6)';
        
        return Database.getQueryLocator(query);
        }
        
        // Adds accounts that meet the criteria to a list of accounts to be deleted
        public void execute(Database.BatchableContext BC, List<sObject> scope){

        List<Account> accDeleteList = new List<Account>();
        for(Sobject s : scope){
            Account acc = (Account) s;
            accDeleteList.add(acc);
        }      
        
        // Deletes the accounts in the account list
        delete accDeleteList;
        }
        
        // Produces a debug message when complete.
        public void finish(Database.BatchableContext BC){
            System.debug('Batch job is finished');
        }
}