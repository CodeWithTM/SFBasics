public class ApexHouresDML {

    public void PerformDMLop()
    {
        Account acc = new Account(Name = 'APEX Account 04', Phone='9999900000');
        
        insert acc;
        
        Account accQuery = [SELECT Id from Account WHERE Name = 'APEX Account 04' LIMIT 1];
        
        try
        {
            Contact con = new Contact( FirstName= 'T', LastName = 'M', AccountId = accQuery.Id);
            system.debug('Contact created with Id' + con.Id);
        }
        catch(Exception ex)
        {
            system.debug(ex);
        }
    }
}