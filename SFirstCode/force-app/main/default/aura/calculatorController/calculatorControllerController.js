({
    sum : function(component, event, helper) {
        console.log('Toplama işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)+Number(y);
        
        console.log(result);
        
        component.set("v.result",result);
        
    }, sub : function(component, event, helper) {
        console.log('Toplama işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)-Number(y);
        
        console.log(result);
        
        component.set("v.result",result);
        
    }, mul : function(component, event, helper) { 
        console.log('Toplama işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)*Number(y);
        
        console.log(result);
        
        component.set("v.result",result);
        
    } , div : function(component, event, helper) {
        console.log('Toplama işlemi tıklandı....');
        
        var x = component.get("v.xnumber");
        var y = component.get("v.ynumber");
        
        console.log(x);
        console.log(y);
        
        
        var result = Number(x)/Number(y);
        
        console.log(result);
        
        component.set("v.result",result);
        
    }        
    
    
})