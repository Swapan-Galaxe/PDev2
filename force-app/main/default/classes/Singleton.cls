public class Singleton {
	// private static variable referencing the class
    private static Singleton instance = null;
    public String id {get;private set;} // the id of the record type

    // The constructor is private and initializes the id of the record type
    private Singleton(){
        id = Account.sObjectType.getDescribe()
            .getRecordTypeInfosByName().get('Foo').getRecordTypeId();
    }
    // a static method that returns the instance of the record type
    public static Singleton getInstance(){
        // lazy load the record type - only initialize if it doesn't already exist
        if(instance == null) instance = new Singleton();
        return instance;
    }
}