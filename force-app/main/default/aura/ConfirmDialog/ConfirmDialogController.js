({
    handleConfirmDialog : function(component, event, helper) {
        component.set('v.showConfirmDialog', true);
    },
     
    handleConfirmDialogYes : function(component, event, helper) {
        console.log('Yes');
        component.set('v.showConfirmDialog', false);
    },
     
    handleConfirmDialogNo : function(component, event, helper) {
        console.log('No');
        component.set('v.showConfirmDialog', false);
    },
})