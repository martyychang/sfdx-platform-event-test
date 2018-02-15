@isTest
private class AsyncHelloEventTriggerTest {

    @isTest
    private static void publishDefaultHello() {

        // Given
        Datetime testStartTime = Datetime.now();

        // When
        Test.startTest();

        AsyncHelloEvent__e hello = new AsyncHelloEvent__e();

        EventBus.publish(hello);

        // Then
        Test.stopTest();

        Task helloTask = [
            SELECT Id, Subject
            FROM Task
            WHERE CreatedDate >= :testStartTime
        ];

        System.assertEquals('Hello, Salesforce', helloTask.Subject,
                Schema.SObjectType.Task.fields.Subject.label);
    }
}
