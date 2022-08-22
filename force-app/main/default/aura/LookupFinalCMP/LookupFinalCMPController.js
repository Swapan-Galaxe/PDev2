({
	myAction : function(component, event, helper) {
		
        var a=component.get("v.id");
        alert(a)
	},
    alertmsg : function(component, event, helper) {
		
        var a=component.get("v.value");
        alert(a)},
     handleValueChange : function (component, event, helper) {
        alert('a handle value change')
        console.log("old value: " + event.getParam("oldValue"));
        console.log("current value: " + event.getParam("value"));
    }
})