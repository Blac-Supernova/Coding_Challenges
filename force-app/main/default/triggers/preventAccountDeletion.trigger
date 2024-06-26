trigger preventAccountDeletion on Account (before delete) {
    // Set to hold account Ids that are being checked
    Set<Id> accountIds = new Set<Id>();

    // Add Ids to that set variable
    for (Account a : Trigger.old){
        accountIds.add(a.Id);
    }

    // Use query to see if related contacts exist
    List<Contact> associatedContact = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds];

    // List of accounts with associated contacts
    Set<Id> accountsWithContacts = new Set<Id>();

    for(Contact c :associatedContact){
        accountsWithContacts.add(c.AccountId);
    }

    //Throw an error to prevent deletion
    for(Account a : Trigger.old){
        if(accountsWithContacts.contains(a.Id)){
            a.addError('This account cannot be deleted because it has an associated contact.');
        }
    }


}