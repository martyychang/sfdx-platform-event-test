trigger AsyncHelloEventTrigger on HelloEvent__e (after insert) {
    
    // We're not going for bulk-friendliness here, so for expediency
    // let's just deal with the first event in the batch
    System.enqueueJob(new HelloJob(Trigger.new[0].TargetName__c));
}