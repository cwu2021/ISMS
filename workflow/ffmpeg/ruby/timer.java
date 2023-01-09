// https://www.w3schools.com/java/java_date.asp
import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {
  public static void main(String[] args) {
    LocalDateTime myDateObj = LocalDateTime.now();
    System.out.println("Before formatting: " + myDateObj);
    DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");

    String formattedDate = myDateObj.format(myFormatObj);
    System.out.println("After formatting: " + formattedDate);
// https://stackoverflow.com/questions/3403226/how-to-run-linux-commands-in-java
    String s;
    Process p;
    try {
        p = Runtime.getRuntime().exec("ls -aF");
        BufferedReader br = new BufferedReader(
            new InputStreamReader(p.getInputStream()));
        while ((s = br.readLine()) != null)
            System.out.println("line: " + s);
        p.waitFor();
        System.out.println ("exit: " + p.exitValue());
        p.destroy();
        } catch (Exception e) {}
  }
}
// simple run with 'java timer.java'
