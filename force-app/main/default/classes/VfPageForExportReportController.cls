global with sharing class VfPageForExportReportController {

    //public String accountName { get; set; }
    public static List<Report> Reports { get; set; }
    public VfPageForExportReportController() { } // empty constructor
    
    @RemoteAction
    global static List<Report> getReports() {
        Reports = [select Id,Name from Report];
        return Reports;
    }
	@RemoteAction
    global static String getRemoteCSV(string reportId) {
        ApexPages.PageReference report = new ApexPages.PageReference('/'+reportId);
		return EncodingUtil.base64Decode(EncodingUtil.base64Encode(report.getContent())).toString();
    }
    
    @RemoteAction
    global static String getReportName(string reportId) {
        string reportname = [Select Name from Report where Id =: reportId].Name;
		return reportname;
    }
}