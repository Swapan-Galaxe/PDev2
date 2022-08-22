<aura:application extends="force:slds">
    <!--<c:PromisePatternJavascript/>-->
    <c:GenericTreeGridComponent ltngcurrentRecId="0016F00001xhxaFQAQ"
                                     ltngSobjectName="Account"
                                     ltngParentFieldAPIName="ParentId"
                                     ltngColumnLabelList="['Name','Type','Industry','Account Owner']"
                                     ltngColumnAPINameList="['Name','Type','Industry','Owner.Name']"
                                     ltngHyperlinkColumn="Name"/>
     
        
            <c:GenericTreeGridComponent ltngcurrentRecId="5006F00001i50KeQAI"
                                     ltngSobjectName="Case"
                                     ltngParentFieldAPIName="ParentId"
                                     ltngColumnLabelList="['CaseNumber','Subject','Status','Case Owner','Case Owner Email','Account Owner']"
                                     ltngColumnAPINameList="['CaseNumber','Subject','Status','Owner.Name','Owner.Email','Account.Owner.Name']"
                                     ltngHyperlinkColumn="CaseNumber"
                                     ltngHeaderValue="Case Hierarchy"/>
</aura:application>