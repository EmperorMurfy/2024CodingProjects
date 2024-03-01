// File: test.java
// Name: Mason Z.
// Date: Dec 19, 2023
// Description: test wordSwap method for article lists


import java.util.Scanner;

public class test { // CURRENT TEST - wordSwap
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		//Code Explanation
		
		//Example Sentence
		String sentenceEx = "PHILADELPHIA, Dec. 18, 2023 /PRNewswire/ --\n"
				+ "FMC Corporation (NYSE: FMC), a leading global agricultural sciences company, today announced that its board of directors has elected Patrick (Pat) Day as … [+2343 chars]\n"
				+ "";
		System.out.println(sentenceEx);
		
		// Requests User to Input First Word and Second or Word A/B - Would be implimented in Main then sent to Articles
		System.out.println("Please input a word A");
		String wordA = sc.nextLine();
		
		System.out.println("Please input a word B");
		String wordB = sc.nextLine();
		
		// Check if words are the same - would be implemented in main but also could work in article?  - > perhaps unnecessary...
		if (wordA.equals(wordB)) {
			System.out.println("word is the same");
		}
		
		// Implimented in Articles
		String regexA = "(?i)\\b" + wordA + "\\b"; 
		String regexB = "(?i)\\b" + wordB + "\\b";
		
		// Create a Temp Word to Replace Word A with
		String temp = "WORD A";

		// Note, it does seem to only detect the word if it is the exact same. 
		// Meaning that if you are trying to find "Example" and entered "example" it won't do anything. But if you enter "Example" it will. 

		sentenceEx = sentenceEx.replaceAll(regexA, temp); // Word A -> Temp
		sentenceEx = sentenceEx.replaceAll(regexB, wordA); // Word B -> Word A
		sentenceEx = sentenceEx.replaceAll(temp, wordB); // Tempt -> Word B or (Word A -> Temp -> Word B)
		
		// Print out final result, but would be returned instead of printed
		System.out.println(sentenceEx);

	}

}
