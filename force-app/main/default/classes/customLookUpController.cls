public class customLookUpController {
    @AuraEnabled
    public static List <Ticket_Booking__c> fetchLookUpValues(String searchKeyWord, String ObjectName) {
        system.debug('ObjectName-->' + ObjectName);
        String searchKey = searchKeyWord + '%';
        
        List <Ticket_Booking__c> returnList = new List <Ticket_Booking__c> ();
      
        // Create a Dynamic SOQL Query For Fetch Record List with LIMIT 5   
        String sQuery =  'select id, Name from ' +ObjectName + ' where Name LIKE: searchKey order by createdDate DESC limit 5';
        List <Ticket_Booking__c> lstOfRecords = Database.query(sQuery);
        
        for (Ticket_Booking__c obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
}