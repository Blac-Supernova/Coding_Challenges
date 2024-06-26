trigger defaultEmailTrigger on Contact (before insert, before update) {
    // Itterate through new entries
    for (Contact con : Trigger.new){
        // Use if statement to fill in unpopulated email fields with a default value
        if(String.isBlank(con.Email)){
            con.Email = 'defaultEmail@jdoe.com';
        }
    }
}