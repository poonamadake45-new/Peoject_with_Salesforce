trigger PreventDeleteOnLeaveRecord on Leave_Information__c (before delete) {
   for (Leave_Information__c record : Trigger.old) {
      
        if (record.Leave_Status__c == 'Approved' || record.Leave_Status__c == 'Completed') {
           
            record.addError('You cannot delete a leave record with an Approved or Completed status.');
        }
    }
}