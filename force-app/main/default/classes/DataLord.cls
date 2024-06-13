public with sharing class DataLord {
    public static Integer NumAccounts (){
        Integer numberOfAccounts = [SELECT count() FROM Account];
        return numberOfAccounts;
    }
    
    public static Integer NumHot(){
        Integer numberOfAccounts = [SELECT count() FROM Account WHERE rating = 'Hot'];
        return numberOfAccounts;
    }
    public static Integer NumComplex(){
        Integer numberOfAccounts = [SELECT count() FROM Account WHERE Name LIKE '%&%'];
        return numberOfAccounts;
    }
        public static List <Account> bigFive(){
        List <Account> topFiveAccounts = [SELECT Id, Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC LIMIT 5];      
            return topFiveAccounts;
    }
    public static List<Opportunity> LastBigOpportunity(){
        List<Opportunity> lastBigOne = [SELECT Name, CloseDate, Amount FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1];
        return lastBigOne;
    }
    public static List<Contact> MajorPlayers(){
        List<Contact> hotContacts = [Select firstName, LastName, Account.Name, phone, email FROM Contact Where Account.Rating = 'Hot'];
        return hotContacts;
    }
    public static Account  MostPopularAccount(){
        //Find the most reocurring accountID from contacts
        AggregateResult[] popularAccountFromContacts = [SELECT AccountId, COUNT(Id) 
        FROM Contact 
        GROUP BY AccountId 
        ORDER BY COUNT(Id) DESC 
        LIMIT 1];
        //Extract the accountId from the result
        Id popularAccountId = (Id)popularAccountFromContacts[0].get('AccountId');
        //Plug in id value from the previous query to find the Account Name
        Account themostPopularAccount = [SELECT Name From Account WHERE Id = :popularAccountId];
        return theMostPopularAccount;
    }
    
    public static void FindTom(){
        List<List<sObject>> findingTom = [Find 'Tom' IN ALL FIELDS RETURNING Lead(Name), Contact(FirstName, LastName)];
        System.debug(findingTom);
    }
    
}