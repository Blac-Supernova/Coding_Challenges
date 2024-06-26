trigger updateAssociatedAccountPhone on contact (after update) {
    //Map to hold account IDs that to the new updated phone number
    Map<Id, String> accountUpdatedPhones = new Map<Id,String>();

    //Itterate through updated contacts
    for (Contact con : Trigger.new){
        // Check if the number has been changed
        if (con.Phone != Trigger.oldMap.get(con.Id).Phone) {
            accountUpdatedPhones.put(con.AccountId, con.Phone);
        }
    }

    // List to hold accounts that need to be updated
    List<Account> accountsToUpdate = new List<Account>();

    // Use a SOQL query to find the accounts that need to be updated
    for(Account a : [SELECT Id, Phone FROM Account WHERE Id IN :accountUpdatedPhones.keySet()]){
        a.Phone = accountUpdatedPhones.get(a.Id);
        accountsToUpdate.add(a);
    }

    if(!accountsToUpdate.isEmpty()){
        update accountsToUpdate;
    }


}