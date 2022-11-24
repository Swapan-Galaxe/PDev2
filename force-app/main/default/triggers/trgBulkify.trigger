trigger trgBulkify on Opportunity (before insert, after update) {

    Set<Id> ownerIds = new Set<Id>();

    for(Opportunity op : trigger.new)
    {
        ownerIds.add(op.OwnerId);
    }

    Map<Id,User> mapUsers = new Map<Id, User>([SELECT Id, Profile.Name FROM User WHERE Id IN :ownerIds]);
    for(Opportunity op : trigger.new)
    {
        User oOwner  = mapUsers.get(op.OwnerId);
        if(oOwner.profile.Name == 'Standard User')
        {
            op.Amount = 100;
        }
    }
}