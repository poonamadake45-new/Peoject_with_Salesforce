trigger PracticeTrigger1 on Contact (after insert) {
/*
    if((trigger.isInsert) && (trigger.isafter)){
List<Account> AccList = new List <Account>();
        for(Contact Cont: Trigger.new){
            if (Cont.AccountId == null){
            Account Acc = new Account();
			Acc.Name = Cont.LastName;
            Acc.Phone = Cont.Phone;
            AccList.add(Acc);  
        }
    }
        if(!AccList.isEmpty()){
           insert AccList; 
        }

    }
*/
}