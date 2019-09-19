public with sharing class AutoPopulateExample{
    public List<Fare_Price__c> updatedFarePrice {get;set;}
    public Integer noOfPassengers{get;set;}
    public Decimal TotalFare{get;set;}
    public Fare_Price__c Testing {get;set;}
    public AutoPopulateExample(ApexPages.StandardController controller)
    {
        //Testing = new Fare_Price__c();
        this.Testing = (Fare_Price__c)Controller.getRecord();
    }
    public Decimal display()      
    {
         //Testing = new Fare_Price__c();
       if(testing.From__c!=null && testing.To__c!=null && testing.Class__c!=null && (testing.Date__c>system.today() && testing.Date__c<system.today()+30))
        { 
            updatedFarePrice = [SELECT Total_Fare__c,Train__c,id,From__c,To__c,Amount__c  FROM Fare_Price__c WHERE From__c=:Testing.From__c AND To__c=:Testing.To__c AND Class__c=:Testing.Class__c limit 1];
            TotalFare = noOfPassengers* updatedFarePrice[0].Amount__c ;
        }else{
            apexpages.addMessage(new apexpages.message(Apexpages.Severity.ERROR,'Please enter valid data'));
        }
        return null;
    } 
  
    public pagereference book()
        
    { 
        pagereference pg=new pagereference('/apex/onsubmit?att='+noOfPassengers+'&&att1='+Testing.From__c+'&&att2='+testing.To__c+'&&att3='+Testing.class__c);
        return pg;
        
    }
}