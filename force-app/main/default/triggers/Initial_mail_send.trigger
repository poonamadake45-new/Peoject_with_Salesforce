trigger Initial_mail_send on Account (after insert) {
    // List to hold email messages
    List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
    
    // Loop through the newly created accounts
    for (Account newAccount : Trigger.new) {
        // Check if the account creation is successful and has an email address
        if (newAccount.E_mail__c != null) {
            // Create a new email message
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            
            // Set the recipient of the email (new account's email)
            email.setToAddresses(new String[] { newAccount.E_mail__c });
            
            // Set the email subject
            email.setSubject('Account Created Successfully');
            
            // Set the email body (you can use an email template if desired)
            email.setPlainTextBody('Hello ' + newAccount.Name + ',\n\nYour account has been created successfully in our system.');
            
            // Add the email to the list
            emailsToSend.add(email);
        }
    }
    
    // Send the email if the list is not empty
    if (!emailsToSend.isEmpty()) {
        Messaging.sendEmail(emailsToSend);
    }
}