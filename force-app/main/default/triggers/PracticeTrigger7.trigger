trigger PracticeTrigger7 on Candidate__c (before insert) {
 set<string> CanList = new set<string>();
    list<Candidate__c> ExstingCanList= [select id,name from Candidate__c];
    
    for(Candidate__c con:ExstingCanList){
        CanList.add(con.Name);
    }
    
    for(Candidate__c cn:trigger.new){
        string cname = cn.Name;
        System.debug('Teting VS Code');
        
     if(CanList.contains(cname)){
            cn.adderror('Duplicate not allowed');
        }
     else{
            CanList.add(cname);
        }        
    }
}