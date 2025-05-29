public class FutureMethodDemo {

    public void CallFuture()
    {
    	futuremethod1();  
        futuremethod2(); 
    }
    
    @future
    public static void futuremethod1()
    {
        system.debug('FM 1');
    }
    
    @future
    public static void futuremethod2()
    {
        system.debug('FM 2');
    }
}