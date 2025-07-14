trigger PracticeTrigger8 on Account (before delete) {
    if (Trigger.isDelete && Trigger.isBefore) {
        // Get all Contacts related to the Accounts being deleted
       /* List<Contact> contList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :Trigger.oldMap.keySet()];

        // If contacts exist, set their AccountId to null (i.e., unlink them)
        for (Contact con : contList) {
            con.AccountId = null;
        }

        // Update the contacts to save the changes
        update contList;*/
List<Contact> ContList = [Select Id , AccountId from Contact where AccountId IN: Trigger.OldMap.Keyset()];

        for(Contact con: ContList){
            Con.AccountId= null;
        }
    }
}