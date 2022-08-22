public class S3Controller 
{
    @AuraEnabled
    public static FileData GetS3FileUsingFileId(string recordId)
    {
        String key = 'e5dab5c3-e044-45bc-8699-51d56d907ca7'; 
        String secret = 'arn:aws:secretsmanager:us-west-2:337667829256:secret:SalesforceCredentials-67d8xx';
        String bucket = 'salesforcedemo'; 
        String host = 's3-ap-south-1.amazonaws.com';
        String method = 'GET';
        AWSS3Service service=new AWSS3Service(key,secret,bucket,method,host);
       	FileData data=service.GetDocumentUsingFileId(recordId);
        return data;
    }
}