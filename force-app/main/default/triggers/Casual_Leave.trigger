trigger Casual_Leave on Leave_Information__c (before insert) {
	
    Map<Id, Decimal> casualLeaveTotal = new Map<Id, Decimal>();
	Integer currentYear = Date.today().year();
    Set<Id> employeeIds = new Set<Id>();
    for (Leave_Information__c newLeave : Trigger.new) {
        if (newLeave.Employee_LApp__c != null) {
            employeeIds.add(newLeave.Employee_LApp__c);
        }
    }
    List<Leave_Information__c> existingLeaves = [SELECT Id, Employee_LApp__c, Leave_Type__c, Days_Applied__c,
                                                 Leave_Year_c__c
                                                 FROM Leave_Information__c 
                                                 WHERE Employee_LApp__c IN :employeeIds 
                                                 AND Leave_Year_c__c = :currentYear];
    for (Leave_Information__c leave : existingLeaves) {
           if (leave.Leave_Type__c == 'Casual Leave') {
            if (!casualLeaveTotal.containsKey(leave.Employee_LApp__c)) {
                casualLeaveTotal.put(leave.Employee_LApp__c, 0);
            }
            casualLeaveTotal.put(leave.Employee_LApp__c, casualLeaveTotal.get(leave.Employee_LApp__c) +
                                 leave.Days_Applied__c);
        }
    }
    for (Leave_Information__c newLeave : Trigger.new) {
        Decimal currentTotalCasual = casualLeaveTotal.get(newLeave.Employee_LApp__c);
        if (newLeave.Leave_Type__c == 'Casual Leave') {
            if (currentTotalCasual + newLeave.Days_Applied__c > 5) {
                newLeave.addError('You cannot apply for more than 5 casual leave days in a year.(Apexcode)');
            }
        }
    }
}