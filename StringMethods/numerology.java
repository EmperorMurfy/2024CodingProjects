// File: numerology.java
// Name: Mason Z.
// Date: Dec 21, 2023
// Description: numerology method tester

import java.util.Scanner;


public class numerology {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int sum = 0;
    // title.replaceAll(" ", ""); // Remove space from consideration
    String title = "This is just a FUNNY title.";
   
    for (char c : title.toCharArray()) { //turns to char
      if (Character.isUpperCase(c)) { //see if it isUpperCase and converts to ASCII while lowering 
        sum += (int)(Character.toLowerCase(c));
        
      } else {
        sum+= (int)(Character.toUpperCase(c));
      }
    }
    
    System.out.println(sum);
  }
}