trigger LanguageCourseTrigger on Language_Course__c (after insert, after update, after delete) {
    List<Id> recipientIds = new List<Id>();
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

    for (Language_Course__c obj : Trigger.new) {
        // Determine recipients (users, contacts, etc.) based on your logic
        recipientIds.add(obj.CreatedById);

        // Create the email message
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{ 'matthew624@gmail.com' });
        email.setSubject('Notification from Trigger');
        email.setPlainTextBody('An event occurred in the system.');

        // Add the email message to the list
        emails.add(email);
    }

    // Send the emails
    Messaging.sendEmail(emails);
}