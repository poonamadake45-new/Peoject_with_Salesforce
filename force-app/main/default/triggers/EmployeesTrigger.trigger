// no of project 2 then automatically records get created
trigger EmployeesTrigger on Employees__c (after insert) {

		//List to hold the project records to be inserted
		//List<Projects__c> ListOfProjects  = new List<Projects__c>();
		List<Project__c> listOfProjects =new List<Project__c>();
//List<Projects__c> listOfProjects = new List<Projects__c>();	
    
    for(Employees__c emp : Trigger.new)
    {
        //check if No_of_project__c should be greater than 0
		if(emp.No_of_project__c != null && emp.No_of_project__c > 0 )
        {
			//Loop to create the specified Number of Projects
           for(Integer i=1; i<=emp.No_of_project__c; i++)
           {
               Project__c proj = new Project__c();
               proj.Name = 'Devine -'+i;
			   proj.Employees__c = emp.Id;
			   listOfProjects.add(proj);
           }
        }
		insert listOfProjects;
    }

}