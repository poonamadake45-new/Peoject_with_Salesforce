trigger D1_Leave_Reason_not_Blank on Leave_Information__c (before insert) {
for(Leave_Information__c LeaveR : trigger.new){
    if(LeaveR.Leave_Reason__c == null || LeaveR.Leave_Reason__c == '')
    {
        LeaveR.addError('Leave Reason Should not blank');
    }
}
}