trigger PracticeTrigger4 on Account (before insert) {
    if((Trigger.isInsert && Trigger.isbefore) || Trigger.isUpdate) {
        
        for(Account Acc : Trigger.new){
            if(Acc.Industry =='	Banking'){
                Acc.AnnualRevenue = 5000000;
            }
			 else if(Acc.Industry == 'Finance'){
                Acc.AnnualRevenue = 4000000;
            }
			 else if(Acc.Industry =='Insurance'){
                Acc.AnnualRevenue = 3500000;
            }
			 else if(Acc.Industry =='Healthcare'){
                Acc.AnnualRevenue = 2500000;
            }
			 else{
                Acc.AnnualRevenue = 600000;
            }
        }
    }
}