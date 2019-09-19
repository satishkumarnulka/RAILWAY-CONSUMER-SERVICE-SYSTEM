public  class paymentclass { 
    public string bid{set;get;}
    public list<Payment__c> records{set;get;}
    
    private ApexPages.StandardController controller;
    Payment__c request;
    public paymentclass(ApexPages.StandardController controller)
    {
        this.controller = controller;
        records=[select id,name,Booking_ID__c from Payment__c where Booking_ID__c=:bid];
    }
    public pagereference pay()
    {
     
        system.PageReference sp =  controller.save();
       
        //controller.save();
        String bid = String.valueof(sp).remove('System.PageReference[/').remove(']');
        records=[select id,name,Booking_ID__c from Payment__c WHERE id=:bid];
        
        system.debug(records);
        pagereference k=new pagereference('/apex/idpage');
           
        return k;
           }
     
    }