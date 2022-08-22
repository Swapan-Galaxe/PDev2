public class PaginatedList {
    
    public List<string> lstItems = new List<string>();
    
    private String selection;
      public String filterId{get; set;}
    private Integer startIndex = 0;
    private Integer endIndex = 0;
    
    private Integer ACTUAL_SIZE = 0;
    private final Integer ALLOWED_LIST_SIZE=500;
      Map<String,string> mapemailid = new Map<String,String>();
    
    public PaginatedList (){
        addingItems();
    }
    
    private void addingItems()
    {
        lstItems.clear();
        for(listview op:[SELECT id, Name FROM ListView WHERE SobjectType = 'Case' order by name asc ])
        {
             mapemailid.put(op.Id,op.name);  
        }
        for(string dd : mapemailid.keyset())
        {
            lstItems.add(dd);
        }
        ACTUAL_SIZE = lstItems.size();
        Integer tempVar = (ACTUAL_SIZE <= ALLOWED_LIST_SIZE)? ACTUAL_SIZE:ALLOWED_LIST_SIZE;
        startIndex = 0;
        if(ACTUAL_SIZE == ALLOWED_LIST_SIZE || tempVar < ALLOWED_LIST_SIZE)
            endIndex = tempVar - 1;
        else
            endIndex = tempVar - 2;  
        //selection = '';
        selection = lstItems[0];
        //system.debug('lstItems[0] '+lstItems[0]);
    }
    
    public PageReference change(){
        
        if (selection == 'next'){
            startIndex = endIndex + 1;
            Integer tempVar = ((ACTUAL_SIZE - endIndex)< ALLOWED_LIST_SIZE)? (ACTUAL_SIZE - endIndex): ALLOWED_LIST_SIZE;
            if (tempVar == ALLOWED_LIST_SIZE)
                endIndex  = endIndex  + (tempVar - 2);
            else
                endIndex  = endIndex  + (tempVar - 1);
        }
        if (selection == 'prev'){               
            endIndex = startIndex - 1;
            if(endIndex > ALLOWED_LIST_SIZE)
                startIndex = startIndex - (ALLOWED_LIST_SIZE - 2);
            else
                startIndex = startIndex - (ALLOWED_LIST_SIZE - 1);      
        } 
        system.debug('selection '+selection);
        return null;
    }
    
    public List<SelectOption> getItems(){            
        List<SelectOption> options = new List<SelectOption>();
        if(startIndex > 0){
            options.add(new SelectOption('prev','- prev -'));               
        }    
        List<string> lstItems1 = new List<string>();
        for(string dd : mapemailid.keyset())
        {
            lstItems1.add(mapemailid.get(dd));
        }
        for(Integer i=startIndex; i<=endIndex; i++){
            
            options.add(new SelectOption(lstItems[i],lstItems1[i]));  
        }
        if((ACTUAL_SIZE - startIndex) > ALLOWED_LIST_SIZE){
            options.add(new SelectOption('next','- next -'));               
        }                     
        return options;
    }
    
    public String getSelection(){
        if(selection == 'next' || selection == 'prev')
            selection = lstItems[startIndex];
        //filterId = [SELECT Id FROM ListView WHERE SobjectType = 'Case' and Name = : selection ].Id;
        return selection;
    }
    
    public void setSelection(String selection){           
        this.selection = selection;
    }
}