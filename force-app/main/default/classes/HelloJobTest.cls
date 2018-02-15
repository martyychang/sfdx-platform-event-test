@isTest
private class HelloJobTest {

    @isTest
    private static void helloQueueable() {

        // Given
        Datetime testStartTime = Datetime.now();

        // When
        Test.startTest();

        HelloJob job = new HelloJob('Queueable');
        System.enqueueJob(job);

        // Then
        Test.stopTest();

        Task helloTask = [
            SELECT Id, Subject
            FROM Task
            WHERE CreatedDate >= :testStartTime
        ];

        System.assertEquals('Hello, Queueable', helloTask.Subject,
                Schema.SObjectType.Task.fields.Subject.label);
    }
}
