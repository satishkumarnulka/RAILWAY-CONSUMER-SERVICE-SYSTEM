({
doinit : function(component, event, helper) {

        var ullist1=[];
        for(var i=1;i<=10;i++)
        {
            ullist1.push("test"+i);
        }   
        component.set("v.ullist",ullist1);
}
})