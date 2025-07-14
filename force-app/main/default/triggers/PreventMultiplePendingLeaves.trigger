trigger PreventMultiplePendingLeaves on Leave_Information__c (before insert) {
    Set<Id> employeeIds = new Set<Id>();

    for (Leave_Information__c newLeave : Trigger.new) {
        if (newLeave.Employee_LApp__c != null) {
            employeeIds.add(newLeave.Employee_LApp__c);
        }
    }
    List<Leave_Information__c> existingPendingLeaves = [SELECT Id, Employee_LApp__c, Leave_Status__c
                                                        FROM Leave_Information__c 
                                                        WHERE Employee_LApp__c IN :employeeIds 
                                                        AND Leave_Status__c = 'Pending'];

    Set<Id> employeesWithPendingLeaves = new Set<Id>();
    for (Leave_Information__c pendingLeave : existingPendingLeaves) {
        employeesWithPendingLeaves.add(pendingLeave.Employee_LApp__c);
    }

    for (Leave_Information__c newLeave : Trigger.new) {
        if (employeesWithPendingLeaves.contains(newLeave.Employee_LApp__c)) {
            newLeave.addError('Pending Leave Request is already exist for you, let it be Approved to apply for other...');
        }
    }
}