@isTest
public class AutoPopulateExampleTest {
    static testMethod void displayTestifCondition()
    {
        test.startTest();
        Station__c st1=new Station__c();
        st1.Name='test1';
        insert st1;
        Station__c st=new Station__c();
        st.Name='test';        
        insert st;
        Fare_Price__c f=new Fare_Price__c();
        f.Name='TestSatish';
        f.Date__c= system.today()+2;
        f.From__c=st.Id;
        f.To__c=st1.Id;
        f.Amount__c=100;
        f.Class__c='Sleeper';
        insert f;   
        
        ApexPages.StandardController controller=new ApexPages.StandardController(f);
        autopopulateexample auto = new autopopulateexample(controller);
        auto.noOfPassengers=2;
        auto.TotalFare=f.Amount__c=100*auto.noOfPassengers;
        auto.display();
        test.stopTest();
    }
   
    static testMethod void displayTestelseCondition()
    {
        test.startTest();
        Station__c st1=new Station__c();
        st1.Name='test1';
        insert st1;
        Station__c st=new Station__c();
        st.Name='test';        
        insert st;
        Fare_Price__c f=new Fare_Price__c();
        f.Name='TestSatish';
        f.Date__c= system.today()-2;
        f.From__c=null;
        f.To__c=null;
        f.Class__c='Sleeper';
        insert f; 
        
        ApexPages.StandardController controller=new ApexPages.StandardController(f);
        autopopulateexample auto = new autopopulateexample(controller);
        auto.display();
        test.stopTest();
    }

    
    static testmethod void mybook()
    {
        Fare_Price__c f=new Fare_Price__c();
        pagereference p=page.onsubmit;
        test.setCurrentPage(p);
        
        ApexPages.StandardController controller=new ApexPages.StandardController(f);
        autopopulateexample auto = new autopopulateexample(controller);
        auto.book();
    }
    static testmethod void onsubmitsavetest()
    {
        test.startTest();
        Ticket_Booking__c tk=new Ticket_Booking__c();
        pagereference p1 =page.payment;
        test.setCurrentPage(p1);
        ApexPages.StandardController controller=new ApexPages.StandardController(tk);
        onsubmitextension sub = new onsubmitextension(controller);
        sub.Save();
        test.stopTest();
    }
   static testmethod void onsubmitconsttest()
    {
        test.startTest();
        Station__c sta1=new Station__c();
        sta1.Name='samp1';
        insert sta1;
        
        Station__c sta2=new Station__c();
        sta2.Name='samp2';
        insert sta2;
        
        Ticket_Booking__c tk=new Ticket_Booking__c();
        
        tk.From__c=sta1.Id;
        tk.To__c=sta2.Id;
        ApexPages.StandardController controller=new ApexPages.StandardController(tk);
        onsubmitextension sub = new onsubmitextension(controller);
       
        test.stopTest();
    }
   
    
   
     static testmethod void onsubmitaddtest()
    {
        test.startTest();
            
        Ticket_Booking__c tk=new Ticket_Booking__c();
                tk.Name='test123';
        tk.Phone_number_del__c='9876956789';
        tk.Email_del__c='s@gmail.com';
        
        insert tk;
        ApexPages.StandardController controller=new ApexPages.StandardController(tk);
        onsubmitextension con = new onsubmitextension(controller);
        con.noofpassengers=string.valueOf(3);
        con.Add();
        con.addMore();
        
        test.stopTest();
    }
 

     
    static testmethod void paysavetest()
    {
        test.startTest();
        Payment__c py=new Payment__c();
        pagereference ps =page.idpage;
        test.setCurrentPage(ps);
        ApexPages.StandardController controller=new ApexPages.StandardController(py);
        paymentclass paycls = new paymentclass(controller);
        paycls.pay();
        test.stopTest();
    }
    
}