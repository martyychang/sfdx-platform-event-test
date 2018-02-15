public class HelloJob implements Queueable {

    private String targetName;

    public HelloJob(String targetName) {
        this.targetName = targetName;
    }

    public void execute(QueueableContext context) {
        insert new Task(Subject = 'Hello, ' + this.targetName);
    }
}
