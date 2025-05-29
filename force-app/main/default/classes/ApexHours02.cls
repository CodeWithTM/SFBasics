public class ApexHours02 {
    // Private instance variable, each obj will get separate copy
	private string helloString;
    
    // Private static constant variable, only one copy shared across all objs
    private final static string HELLO_TEXT;
    
    static{
        HELLO_TEXT = 'STATIC HELLO TEXT';
    }
    
    // Default constructor
    public ApexHours02()
    {
        this(HELLO_TEXT); // Call to other constructor
    }
    
    // Parameterized constructor
    public ApexHours02(string inputStr)
    {
        this.helloString = 'STR + ' + inputStr;
    }
    
    // Instance method    
    public void printOutput()
    {
        system.debug('O/P: ' + this.helloString);
    }
    
    // Static method - can access only static members, cannot use this keyword inside
    public static void printStaticOutput()
    {
        system.debug('O/P: ' + HELLO_TEXT);
    }
}