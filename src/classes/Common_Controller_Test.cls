@isTest
private class Common_Controller_Test{
    
    static testMethod void test_English() {
        
        User u = createUser('en_US');
        
        Opportunity oppo = new Opportunity();
        ApexPages.StandardController sc = new ApexPages.StandardController(oppo);
        
        System.runAs(u) {
            Test.StartTest();
           
            PageReference pageRef = Page.Delivery_Order;
            Test.setCurrentPage(pageRef);
            Common_Controller controller = new Common_Controller(sc);
            
            Test.StopTest();
            
            system.assertEquals(controller.japaneseFontStyle, '');
        }
    }
    static testMethod void test_Japanese() {
    
        User u = createUser('ja');
        
        Opportunity oppo = new Opportunity();
        ApexPages.StandardController sc = new ApexPages.StandardController(oppo);
        
        System.runAs(u) {
            Test.StartTest();
            
            PageReference pageRef = Page.Delivery_Order;
            Test.setCurrentPage(pageRef);
            Common_Controller controller = new Common_Controller(sc);
            
            Test.StopTest();
            
            system.assertEquals(controller.japaneseFontStyle, '<style type="text/css">body, table, th, td{font-family: Arial Unicode MS;}</style>');
        }
    }
    private static user createUser(String lang){
        List<Profile> p = [select Id from Profile where UserType = 'Standard' limit 1];
        
        return new User(
            username = 'jp.co.uhuru.AMO.testuser1@amo.com',
            LastName = 'test', 
            Email='Simple.Quote.Invoice.Order@uhuru.com',
            Alias='test1', 
            TimeZoneSidKey='America/Los_Angeles',
            ProfileId=p[0].Id,
            LocaleSidKey='en_US',
            LanguageLocaleKey=lang,
            EmailEncodingKey='UTF-8'
        );
    }

}