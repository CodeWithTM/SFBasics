global class ScheduledBatchable implements Schedulable {
	public void execute(SchedulableContext sc)
    {
        // execute batch job inside scheduled job
        APEXBatchDemo apexBatch = new APEXBatchDemo();
		Database.executeBatch(apexBatch, 200);
    }
}