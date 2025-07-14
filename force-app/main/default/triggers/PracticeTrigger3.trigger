trigger PracticeTrigger3 on Contact (before insert, before update, after insert) {
    if((Trigger.isInsert) && (Trigger.isBefore) || (Trigger.isUpdate)){
    for(Contact Cont: Trigger.new){
        if (Cont.HomePhone == null || Cont.HomePhone ==''){
            Cont.HomePhone.addError('Home Phone field is mandatory');
			
        }
        if(Cont.Email == null || Cont.Email ==''){
            Cont.Email.addError('Email field is mandatory');
        }
    }}
    }