//Correct code both earned and casual
trigger ValidateLeaveDays on Leave_Information__c (before insert) {
	
    Map<Id, Decimal> earnedLeaveTotal = new Map<Id, Decimal>();
    Map<Id, Decimal> casualLeaveTotal = new Map<Id, Decimal>();
	Integer currentYear = Date.today().year();
    // Get the set of employee IDs from the new leave records
    Set<Id> employeeIds = new Set<Id>();

    // Loop through the new leave records and add their employee IDs to the set
    for (Leave_Information__c newLeave : Trigger.new) {
        if (newLeave.Employee_LApp__c != null) {
            employeeIds.add(newLeave.Employee_LApp__c);
        }
    }

    // Query to get all leave records for the employees within the same year
    List<Leave_Information__c> existingLeaves = [SELECT Id, Employee_LApp__c, Leave_Type__c, Days_Applied__c, Leave_Year_c__c
                                                 FROM Leave_Information__c 
                                                 WHERE Employee_LApp__c IN :employeeIds 
                                                 AND Leave_Year_c__c = :currentYear];

    // Calculate total leave days for Earned and Casual leave for each employee
    for (Leave_Information__c leave : existingLeaves) {
        if (leave.Leave_Type__c == 'Earned Leave') {
            if (!earnedLeaveTotal.containsKey(leave.Employee_LApp__c)) {
                earnedLeaveTotal.put(leave.Employee_LApp__c, 0);
            }
            earnedLeaveTotal.put(leave.Employee_LApp__c, earnedLeaveTotal.get(leave.Employee_LApp__c) + leave.Days_Applied__c);
        } else if (leave.Leave_Type__c == 'Casual Leave') {
            if (!casualLeaveTotal.containsKey(leave.Employee_LApp__c)) {
                casualLeaveTotal.put(leave.Employee_LApp__c, 0);
            }
            casualLeaveTotal.put(leave.Employee_LApp__c, casualLeaveTotal.get(leave.Employee_LApp__c) + leave.Days_Applied__c);
        }
    }

    // Validate the leave days for each new leave request
    for (Leave_Information__c newLeave : Trigger.new) {
        Decimal currentTotalEarned = earnedLeaveTotal.get(newLeave.Employee_LApp__c);
        Decimal currentTotalCasual = casualLeaveTotal.get(newLeave.Employee_LApp__c);

        // Check if the employee is applying for earned leave and if total exceeds 10 days
        if (newLeave.Leave_Type__c == 'Earned Leave') {
            if (currentTotalEarned + newLeave.Days_Applied__c > 10) {
                newLeave.addError('You cannot apply for more than 10 earned leave days in a year.');
            }
        }

        // Check if the employee is applying for casual leave and if total exceeds 5 days
        if (newLeave.Leave_Type__c == 'Casual Leave') {
            if (currentTotalCasual + newLeave.Days_Applied__c > 5) {
                newLeave.addError('You cannot apply for more than 5 casual leave days in a year.(Apexcode)');
            }
        }
    }
}