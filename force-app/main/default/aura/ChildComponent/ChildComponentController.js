({
    getMessage : function(component, event) {
        //get method paramaters
        var params = event.getParam('arguments');
        if (params) {
            var param1 = params.childGreetingParam;
            var param2 = params.childPersonNameParam;
            alert(param1 + " " + param2);
        }
    }
})