// File: test.java
// Name: Mason Z.
// Date: UNKNOWN December 2023 - January 2024
// Description: test indexOf
import java.util.Scanner;

public class tester {
	public static void main(String[] args) {
	    Scanner sc = new Scanner(System.in);
	    String sentence = "fred flintstone";
	    // int location = sentence.indexOf("?")+1;
	   
	    sentence = sentence.substring(0, sentence.indexOf(" ")) + "?" + sentence.substring(sentence.indexOf(" ") + 1);
	    System.out.println(sentence);
	    

	    System.out.println(sentence.indexOf("z"));
		}
	
	
	   
	}

