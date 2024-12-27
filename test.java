// Sample Java file

public class Sample {

    // Main method: Entry point of the application
    public static void main(String[] args) {
        System.out.println("Hello, World!");

        int result = addNumbers(5, 10);
        System.out.println("The sum is: " + result);

        Sample sample = new Sample();
        sample.printMessage("This is a sample Java file.");
    }

    // A method to add two numbers
    public static int addNumbers(int a, int b) {
        return a + b;
    }

    // An instance method to print a message
    public void printMessage(String message) {
        System.out.println(message);
    }
}
