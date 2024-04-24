// Name: Mason Z.
// Program: PowerOf
// Date: Apr 24, 2024
// Description: powerOf function + superscript function

import java.util.Scanner;

public class PowerOf {


	// run programs 
	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);
		System.out.println("what is base value?");
		int b = s.nextInt();
		System.out.println("what is the exponent? (power of)? ");
		s.nextLine();
		String c = s.nextLine();
		
		int a; 

		// if negative exponent
		if (c.contains("-")) {
			c = c.substring(1);
			a = Integer.valueOf(c);
			System.out.println(b + " to the power of " + "-" + a  + " is " + "1/" + powerOf(b, a));
		}

		// if positive exponent or zero
		else {
			a = Integer.valueOf(c);
			System.out.println(b + " to the power of " + a  + " is " + powerOf(b, a));
		}
	
		
	}


	// powerOf function 
	// recursive function - learning example!
	// b = base, a =  exponent
	private static int powerOf(int b, int a) {
		if (a == 0)
			return 1;
		else 
			return b * powerOf(b, a-1);
	}


	// superScript function
	public static String superscript(int n) {
		// This array stores superscript characters for digits 0-9
		char[] superscriptChars = {'⁰', '¹', '²', '³', '⁴', '⁵', '⁶', '⁷', '⁸', '⁹'};
		StringBuilder sb = new StringBuilder();
		for (char c : String.valueOf(n).toCharArray()) {
			sb.append(superscriptChars[c - '0']);
		}
		return sb.toString();
	}
}
