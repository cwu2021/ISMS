package com.example.guess;
// https://opensource.com/article/20/12/learn-java
class Main {
 public static void main(String[] args) {
  System.out.println("That's right!");
  System.exit(0);
 }
}
/* 
$ java -version
$ java ./Guess.java
$ mkdir -p com/example/guess
$ echo "Manifest-Version: 1.0" > Manifest.txt
$ javac src/Guess.java -d com/example/guess
$ jar cfme Guess.jar \
Manifest.txt \
com.example.guess.Main \
com/example/guess/Main.class
$ jar tvf Guess.jar
$ java -jar Guess.jar
*/
