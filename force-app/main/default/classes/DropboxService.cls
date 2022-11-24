public with sharing class DropboxService {
   
    public class Header
    {
        public string path{get;set;}
        public string mode{get;set;}
        public boolean autorename{get;set;}
        public boolean mute{get;set;}
        public boolean strictconflict{get;set;}
    }
    private static string fileLocation(string file)
    {
        return '/Blog/'+file;  // Change Folder based on your requirement
    }
    private static string createHeaderArgs(string file)
    {
        Header header=new Header();
        header.path=fileLocation(file);
        header.mode='add';
        header.autorename=true;
        header.mute=false;
        header.strictconflict=false;
        return JSON.serialize(header);
    }
        
    public static string Upload(ContentVersion content)
    {
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type','application/octet-stream');
        req.setMethod('POST');
        req.setEndpoint('callout:Dropbox/2/files/upload');
        req.setBodyAsBlob(content.VersionData);
        string fileName=content.Title+'.'+content.FileExtension;
        req.setHeader('Dropbox-API-Arg', createHeaderArgs(content.Title+'.'+content.FileExtension));
        //req.setHeader('Authorization','Bearer '+Label.DropBoxKey);
        req.setTimeout(120000);
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug('Response:'+res.getBody());
        return fileLocation(fileName);
    }
}
