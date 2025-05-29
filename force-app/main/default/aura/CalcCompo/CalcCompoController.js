({
    doInit: function(component, event, helper) {
        var action = component.get("c.GetAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accounts", response.getReturnValue());
            } else {
            }
        });
        $A.enqueueAction(action);
    }
})