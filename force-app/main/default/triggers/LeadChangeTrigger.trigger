trigger LeadChangeTrigger on LeadChangeEvent (after insert) {
     
    System.debug('Lead Change Event Trigger');
     
    //Iterate through each event message.
    for (LeadChangeEvent event : Trigger.New) {
        //Get event header fields
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
         
        switch on header.changeType {
            when 'CREATE'{
                //Craete logic
                System.debug('CREATE');
                break;
            }
            when 'UPDATE'{
                //Update logic
                System.debug('UPDATE');
                break;
            }
            when 'DELETE'{
                //Delete logic
                System.debug('DELETE');
                break;
            }
            when 'UNDELETE'{
                //Undelete logic
                System.debug('UNDELETE');
                break;
            }
        }
    }
}