public class SK_PromisePatternDemoController {
	@AuraEnabled
    public static List<Account> findMyAccounts(integer numberOfRecords){
        return [select id,Name,Type,Industry from Account where createdById=:UserInfo.getUserId() order by LastModifieddate DESC Limit :numberOfRecords];
    } 
    @AuraEnabled
    public static List<Task> findMyPendingTasks(integer numberOfRecords){
        return [select id,Description,Status,Subject from Task where OwnerId=:UserInfo.getUserId() order by LastModifieddate DESC Limit :numberOfRecords ];
    }
}