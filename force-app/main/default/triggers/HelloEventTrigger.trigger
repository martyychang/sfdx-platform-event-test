trigger HelloEventTrigger on HelloEvent__e (after insert) {
    
    // Construct the list of tasks
    List<Task> tasks = new List<Task>();
    
    for (HelloEvent__e eachEvent : Trigger.new) {
        tasks.add(new Task(Subject = 'Hello, ' + eachEvent.TargetName__c));
    }
    
    // Insert the tasks
    insert tasks;
}