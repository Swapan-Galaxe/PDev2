({
    findDataUsingNormalCall : function(component, event, helper) {
        component.set("v.ltngClickedAction","NormalCall");
        component.set("v.ltngAccInfoString","");
        component.set("v.ltngTaskInfoString","");
        var accList=component.set("v.ltngAccList",[]);
        var accList=component.set("v.ltngTaskList",[]);
        //find account list
        component.set("v.ltngAccInfoString","Waiting for apex response from Server to get account records");
        var actionName= component.get("c.findMyAccounts");
        var params={"numberOfRecords":2};
        actionName.setParams(params);
        actionName.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var apexResponse=response.getReturnValue();
                //set response to attribute value
                console.log('***'+JSON.stringify(apexResponse));
                component.set("v.ltngAccInfoString","Response recieved from Server for Account records.");
                component.set("v.ltngAccList",apexResponse);
            }else if(state === "ERROR"){
                var errors = response.getError();
                console.error(errors);
                alert('Problem with connection. Contact your system administrator.');
            }
        });
        $A.enqueueAction(actionName);
        
        
        //find task list
        component.set("v.ltngTaskInfoString","Waiting for apex response from Server to get task records");
        var actionName= component.get("c.findMyPendingTasks");
        var params={"numberOfRecords":2};
        actionName.setParams(params);
        actionName.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var apexResponse=response.getReturnValue();
                //set response to attribute value
                console.log('***'+JSON.stringify(apexResponse));
                component.set("v.ltngTaskInfoString","Response recieved from Server for Task records.");
                component.set("v.ltngTaskList",apexResponse);
            }else if(state === "ERROR"){
                var errors = response.getError();
                console.error(errors);
                alert('Problem with connection. Contact your system administrator.');
            }
        });
        $A.enqueueAction(actionName);
    },
    findDataUsingPromise : function (component,event,helper){
        console.log('****inside findDataUsingPromise');
        component.set("v.ltngAccInfoString","");
        component.set("v.ltngTaskInfoString","");
        component.set("v.ltngClickedAction","PromiseCall");
        var accList=component.set("v.ltngAccList",[]);
        var accList=component.set("v.ltngTaskList",[]);
        
        component.set("v.ltngAccInfoString","Waiting for response from Server to get Account Records.");
        var params={"numberOfRecords":3};
        var accountDataPromise = helper.ServerCallUsingPromise(component,'c.findMyAccounts',params);
        accountDataPromise
        .then(
            $A.getCallback(function(result){
                 // Set Account Attribute
                console.log('***inside success for first promise call');
                console.log('***'+JSON.stringify(result));
                component.set("v.ltngAccInfoString","Response recieved from Server for Account Records.");
                component.set("v.ltngAccList", result);
                console.log('***calling pending task using second promise');
                var params={"numberOfRecords":3};
                component.set("v.ltngTaskInfoString","Waiting for response from Server to get Task Records.");
                return helper.ServerCallUsingPromise(component,'c.findMyPendingTasks',params);
            }),
            $A.getCallback(function(error){
                alert('An error occurred getting the account : ' + error.message);
            })
        )
        .then(
            $A.getCallback(function(result){
                console.log('***inside success for second promise call');
                console.log('***'+JSON.stringify(result));
                component.set("v.ltngTaskInfoString","Response recieved from Server for task records.");
                component.set("v.ltngTaskList", result); // Set task Attribute
            }),
            $A.getCallback(function(error){
                // Something went wrong
                alert('An error occurred while getting the task : ' + error.message);
            })
        );
    } 
    
})