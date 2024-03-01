// File: StringPracticeMain.java
// Name: Mason Z.
// Date: Jan 25, 2024
// Description: further practice with strings

import java.util.Scanner;

public class StringPracticeMain {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		// Switch Statements
		int k = 2;
		switch (k) {
		case 1:
			System.out.println("t");
			break;

		case 2:
			System.out.println("3");
			break;
		}


		// asks user to enter a word
		System.out.println("Word");
		String word = sc.nextLine();

		// adds a space and reversed
		for(int i = word.length()-1; i >= 0; i--) {
			System.out.print(word.charAt(i) + " ");

		}
		System.out.println();

		// capitalizes word 
		System.out.println(word.toUpperCase());

		// capitalize first letter

		// capitalize every word in a sentence

		System.out.println("Enter Sentence");
		String sentence = sc.nextLine();


		String [] sentenceArray= sentence.split(" ");
		for (String i: sentenceArray) {
			System.out.print(i.substring(0,1).toUpperCase()+ i.substring(1) + " ");
		}



		// capitalize every first word in a sentence in a paragraph by identifying the .
		System.out.println();
		System.out.println("Enter Paragraph");
		String paragraph = sc.nextLine();

		String paragraphArray[]  = paragraph.split("\\.(\\s+|$)");
		for (String i: paragraphArray) { // could also do (String i: paragraphArray.split(--)) {
			System.out.print(i.substring(0,1).toUpperCase()+ i.substring(1) + ". ");
		}

		//ShoutWord tester
				String sentenceEx = "Example Sentence for ArticleList Project, Shoutword: Food is good, food is great, food is everything.";
				System.out.println(sentenceEx);
				System.out.println("Please input a word");
				String wordA = sc.nextLine();
				String regex = "(?i)\\b" + wordA + "\\b";

				// Note, it does seem to only detect the word if it is the exact same. 
				// Meaning that if you are trying to find "Example" and entered "example" it won't do anything. But if you enter "Example" it will. 

				System.out.println(sentenceEx.replaceAll(regex, wordA.toUpperCase()));

			
	}



}












