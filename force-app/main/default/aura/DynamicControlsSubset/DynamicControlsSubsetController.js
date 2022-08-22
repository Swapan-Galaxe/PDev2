({
	  showPressedButtonLabel : function(component, event, helper){
        alert('You pressed:'+event.getSource().get("v.label"));
        
         component.find("inputValue").get("v.value");
        alert('You pressed:'+component.find("inputValue1").get("v.value"));
            alert('You pressed:'+ event.getSource().getLocalId());
         
    }
})