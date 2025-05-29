public class QueueableAPEXDemo implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Acme',Phone='9999900001');
        insert a;        
    }
}