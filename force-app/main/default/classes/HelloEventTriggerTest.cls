@isTest
private class HelloEventTriggerTest {

    @isTest
    private static void publishDefaultHello() {

        // Given
        Datetime testStartTime = Datetime.now();

        // When
        Test.startTest();

        HelloEvent__e hello = new HelloEvent__e();

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
