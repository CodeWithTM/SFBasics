@isTest
public class ApexHoursTest {

    @isTest
    public static void AccountTest()
    {
		Account acc = new Account(Name = 'APEX Account 05'); // Failure case Phone is mandate
        
        insert acc;     
    }
}