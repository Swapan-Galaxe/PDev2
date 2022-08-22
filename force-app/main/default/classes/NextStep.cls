public with sharing class NextStep {

    public NextStep() { }
    public NextStep(ApexPages.StandardController controller) { }

    String[] NextSteps = new String[]{};
     public PageReference test() {
        return null;
    }
            
    public Task task {get; set;}
        
    public List<SelectOption> getNextStepOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('A.C.McClurg','A.C.McClurg'));
        options.add(new SelectOption('Apress','Apress'));
        options.add(new SelectOption('Athabasca University Press','Athabasca University Press'));
        options.add(new SelectOption('Arkham House','Arkham House'));         
        options.add(new SelectOption('Atlantic Books','Atlantic Books')); 
        options.add(new SelectOption('Atlas Press','Atlas Press')); 
        options.add(new SelectOption('ATOM Books','ATOM Books')); 
        return options;
    }
            
    public String[] getNextSteps() {
        return NextSteps;
    }
        
    public void setNextSteps(String[] NextSteps) {
        this.NextSteps = NextSteps;
    }
}