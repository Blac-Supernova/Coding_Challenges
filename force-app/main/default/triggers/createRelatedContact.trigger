trigger createRelatedContact on Account (after insert) {
    List<Contact> newRelatedContacts = new List<Contact>();

    for (Account acct : Trigger.new){
        Contact defaultContact = new Contact (
            FirstName = 'John',
            LastName = 'Doe',
            AccountID = acct.Id
        );
        newRelatedContacts.add(defaultContact);
    }

    // Insert contacts

    if(!newRelatedContacts.isEmpty()){
        insert newRelatedContacts;
    }

}