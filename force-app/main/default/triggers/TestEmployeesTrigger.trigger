//Add error msg when its null or empty
trigger TestEmployeesTrigger on Employees__c (before insert) { // we can add 'before update' and 'before delete'
/*for ( Employees__c emp : trigger.new){
        if(emp.Emp_Id__c == null || emp.Emp_Id__c == ''){
            emp.addError('Employee ID Cannot be blank...'); 
        }else{
            emp.Emp_Id__c  ='validated-' + emp.Emp_Id__c;
        }*/

 /*public static void String Errormsg = 'Employee ID and Project name Cannot be blank...';
 for ( Employees__c emp : trigger.new){ // at a time 2 field update , record same kel ki validated - EmpiId print honar
        if(emp.Emp_Id__c == null || emp.Emp_Id__c == '' || emp.Desi__c == null || emp.Desi__c == '' ){
           // emp.addError('Employee ID and Project name Cannot be blank...'); 
			emp.addError(Errormsg);
        }
		else
		{
            emp.Emp_Id__c  ='validated-' + emp.Emp_Id__c;
			 emp.Desi__c=  emp.Desi__c;
        }*/
/*
    if(Trigger.isBefore && Trigger.isInsert)
	{
        EmployeeTriggerHandler.CheckEmpId()
    }*/

public static final String errorMsg = 'Employee ID and Project name Cannot be blank...';//Variable create karun execute krne
for ( Employees__c emp : trigger.new){
        if(emp.Emp_Id__c == null || emp.Emp_Id__c == ''){
			emp.addError(errorMsg);
        }
		else
		{
            emp.Emp_Id__c  ='validated-' + emp.Emp_Id__c;
			
      
    }
}
}