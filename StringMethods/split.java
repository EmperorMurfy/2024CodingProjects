// File: split.java
// Name: Mason Z.
// Date: Feb 27, 2024
// Description: demonstrates .split use

import java.util.Scanner;
public class split {
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		String input;
		System.out.println("Enter Input");
		input = s.nextLine();
		
		String [] sentenceArray= input.split(" ");
		
		for (String i: sentenceArray) {
			System.out.print(i.substring(0,1).toUpperCase() + i.substring(1) + " ");
		}
		
	}
		
	
	
}
