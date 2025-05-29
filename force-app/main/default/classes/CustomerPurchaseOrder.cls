public class CustomerPurchaseOrder extends Highlight implements IPurchaseOrder {
	public void Discount()
    {
        system.debug('5% discount');
    }
    
    public override void Highlight()
    {
        system.debug('YELLOW Highlight');
    }
}