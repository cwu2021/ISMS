/* OpenJDK versus Oracle JDK
https://www.redhat.com/en/topics/application-modernization/openjdk-vs-oracle-jdk */
// https://www.programiz.com/java-programming/examples/fibonacci-series
// https://github.com/trending/java
// apt install openjdk-11-jre-headless
/* java --help: Usage: java [options] <mainclass> [args...]
           (to execute a class)
   or  java [options] -jar <jarfile> [args...]
           (to execute a jar file) */
class Main {
  public static void main(String[] args) {

    //int n = 10, firstTerm = 0, secondTerm = 1;
    int n = 15, firstTerm = 0, secondTerm = 1;
    System.out.println("Fibonacci Series till " + n + " terms:");

    for (int i = 1; i <= n; ++i) {
      System.out.print(firstTerm + ", ");

      // compute the next term
      int nextTerm = firstTerm + secondTerm;
      firstTerm = secondTerm;
      secondTerm = nextTerm;
    }
      // additional print for newline.
      System.out.print("\n");
  }
}
