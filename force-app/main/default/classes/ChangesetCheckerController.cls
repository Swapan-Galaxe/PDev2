public class ChangesetCheckerController
{
@RemoteAction
public static String checkChg(String url)   
{
    String html = '';
    try
    {
        PageReference page = new PageReference(url);
        Blob b = page.getContent();
        html = String.valueof(b);
        system.debug(html);
    }
    catch(Exception e)
    {
    }
    return html;
    }
}