public with sharing class AccountAuraController {
    @AuraEnabled
    public static List<Account> GetAccounts(){
        List<Account> lstAcc = [SELECT Id, Name, Industry, Phone, Website FROM Account LIMIT 10];
        
        return lstAcc;
    }
}