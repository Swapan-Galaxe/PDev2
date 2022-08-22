public without sharing class Remainder
{
public List<SelectOption> countrieLst {get;set;}
 public  String s {get;set;}
   public boolean Rstatus{get;set;}
    public   Remainder(ApexPages.StandardController controller)
    {
    countrieLst = new List<SelectOption>();
   
  
  countrieLst.add(new SelectOption('','--None--'));
  countrieLst.add(new SelectOption('India','India'));
  countrieLst.add(new SelectOption('China','China'));
  countrieLst.add(new SelectOption('US','US'));
  
     s='21:00';
     Rstatus=true;
    }
     public SelectOption[] getReminderTimeList() 
        {   
            string TaskReminderTime = '08:00';
            SelectOption[] options = new SelectOption[]{};
            String mins = '30';
           
            for (Integer i = 0; i < 48; i++) 
            {
                if(i <= 23)
                {
                    mins        = (mins == '30') ? '00' : '30';
                    Integer hrs = ((i*30) / 60);
                    String hr   = (string.valueOf(hrs).length() == 1) ? '0' + string.valueOf(hrs) : string.valueOf(hrs);           
                    String key = hr + ':' + mins + ' AM';
                    options.add(new SelectOption(key, key));
                }
                if(i > 23)
                {
                    mins        = (mins == '30') ? '00' : '30';
                    Integer hrs = ((i*30) / 60);
                    String hr   = (string.valueOf(hrs).length() == 1) ? '0' + string.valueOf(hrs) : string.valueOf(hrs);           
                    String key = hr + ':' + mins + ' PM';
                    options.add(new SelectOption(key, key));
                }
            }
            return options;   
        }
  
    

      

}