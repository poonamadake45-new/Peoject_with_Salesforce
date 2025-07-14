trigger PracticeTrigger on Account (before insert) {
    if((Trigger.isbefore) && ((Trigger.isInsert) || (Trigger.isUpdate))){
        for(Account Acc : Trigger.new){
            if (Acc.Industry == 'Banking' || Acc.Industry == 'Energy' ){
                Acc.Rating ='Trial';
            }
            else{
                Acc.Rating = 'ABC';
            }
        }   
    }
}