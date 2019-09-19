public with sharing class onsubmitextension {
    public string noofpassengers{set;get;}
    public string fromval{set;get;}
    public string toval{set;get;}
    public string classval{set;get;}
    public Station__c station{set;get;}
    public Station__c station1{set;get;}
    public Ticket_Booking__c acct {get;set;}
    
    
    public List<Ticket_Booking__c>lstAcct  = new List<Ticket_Booking__c>();
    
    //list of the inner class
    public List<innerClass> lstInner {get;set;}
    
    //will indicate the row to be deleted
    public String selectedRowIndex{get;set;}	
    
    //no. of rows added/records in the inner class list
    public Integer count = 1;
    
    
    ////save the records by adding the elements in the inner class list to lstAcct,return to the same page
    public PageReference Save()
    {
        
        
        PageReference pr = new PageReference('/apex/payment');
        
        for(Integer j = 0;j<lstInner.size();j++)
        {
            
            lstAcct.add(lstInner[j].acct);
            
        } 
        for(Ticket_Booking__c tickets: lstAcct){
            tickets.From__c = fromval;
            tickets.To__c=toval;
            tickets.Type_Of_Seat__c=classval;
        }
        insert lstAcct;
        pr.setRedirect(True);
        
        return pr;
    }
    
    //add one more row
    public void Add()
    {	//count=integer.valueOf(noofpassengers);
        if(count<integer.valueOf(noofpassengers))   
        {
        count = count+1;
        
        addMore();	
        }
    }
    
    /*Begin addMore*/
    public void addMore()
    {
        //call to the iner class constructor
        innerClass objInnerClass = new innerClass(count);
        
        //add the record to the inner class list
        lstInner.add(objInnerClass);    
        
        system.debug('lstInner---->'+lstInner);            
    }/* end addMore*/
    
    /* begin delete */
    public void Del()
    {
        system.debug('selected row index---->'+selectedRowIndex);
        lstInner.remove(Integer.valueOf(selectedRowIndex)-1);
        count = count - 1;        
    }/*End del*/
    
    
    /*Constructor*/
    public onsubmitextension(ApexPages.StandardController ctlr)
    {   
        noofpassengers=apexpages.currentpage().getparameters().get('att');
        fromval=apexpages.currentpage().getparameters().get('att1');
        if(fromval!=null){
            station= [select name from Station__c where id=:fromval];
        }
        toval=apexpages.currentpage().getparameters().get('att2');
        if(toval!=null){
            station1= [select name from Station__c where id=:toval];
        }
        classval=apexpages.currentpage().getparameters().get('att3');
        lstInner = new List<innerClass>();
        addMore();
        selectedRowIndex = '0';
        
    }/*End Constructor*/
    /*Inner Class*/
    public class innerClass
    {	
        public String recCount{get;set;}
        public Ticket_Booking__c acct {get;set;}
        public innerClass(Integer intCount)
        {            
            recCount = String.valueOf(intCount);
            acct = new Ticket_Booking__c();
        }
    }
}