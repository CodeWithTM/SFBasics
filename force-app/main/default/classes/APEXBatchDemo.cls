//my apex class
global class APEXBatchDemo implements Database.Batchable<Sobject>, Database.Stateful {
    private string listViewId = '';
    private List<string> failedUsers = new List<string>();
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('start');
        
        listViewId = [Select Id from ListView Where DeveloperName = 'MyOpportunities' Limit 1].Id;
        
        return Database.getQueryLocator('SELECT Id FROM User');
    }
    
    global void execute(Database.BatchableContext bc, List<User> userList){
        system.debug('execute');
        try
        {
            List<CalendarView> calendarViews = new List<CalendarView>();
            for (User user : userList) {
                CalendarView calendarView = new CalendarView(
                    name = 'Opportunity Close Dates', 
                    SobjectType = 'Opportunity', 
                    StartField = 'CloseDate', 
                    DisplayField = 'Name', 
                    Color = '9050e9',
                    OwnerId = user.Id,
                    ListViewFilterId = listViewId
                );
                calendarViews.add(calendarView);
            }
            
            insert calendarViews;
        }
        catch(Exception ex)
        {
            
        }
    }
    
    global void finish(Database.BatchableContext bc){
        system.debug('finish, total Logs:');
    }
}