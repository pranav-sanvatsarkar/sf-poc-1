@isTest
public class TestAccountOverrideController 
{
    static testMethod void myUnitTest()
    {
     	Account accObj = new Account();
        accObj.Name = 'Pronow';
        insert accObj;
        system.assertNotEquals(accObj.Id, null);
        /*
        ApexPages.StandardController sc = new ApexPages.StandardController(accObj);
        AccountOverridController accCon = new AccountOverridController(sc);   
        accCon.StrComponentName = 'SampleController';
        accCon.getCustomComponent();
*/
    }
}