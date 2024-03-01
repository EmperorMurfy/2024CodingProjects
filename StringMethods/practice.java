// File: practice.java
// Name: Mason Z.
// Date: Jan 24, 2024
// Description: general string method practice and tester

import java.util.ArrayList;
public class practice {
	public static void main(String[] args) {
	String [] s = new String[2];
	s[0] = "1";
	System.out.println(s.length);
	System.out.println(s[0]);
	 
	ArrayList<String> arraylist = new ArrayList<>();
	arraylist.add("food");
	System.out.println(arraylist.get(0));
	
	//Working ^
	
	// return the sum
	ArrayList<Integer> num= new ArrayList<>();
	num.add(1);
	num.add(2);
	int sum = 0;
	
	for(int e: num) {
		sum += e;
	}
	
	System.out.println("food" + sum);
	
	
	ArrayList<Integer> remove = new ArrayList<>();
	remove.add(1);
	remove.add(2);
	remove.add(2);
	remove.add(3);
	remove.add(4);
	int value = 1;
	
	for (int i = remove.size() - 1; i >= 0; i--) {
		if (remove.get(i).equals(value)) {
			remove.remove(i);
		}
	}
	
	//tester
	
	for (int i = 0; i < remove.size(); i++) {
		System.out.println(remove.get(i));
	}
	
	int [] array = new int[2];
	array[0] = 2;
	
	System.out.println(array[0]);
	System.out.println(array.length);
	
	String word = "hi";
	
	System.out.println(word.length());
	System.out.println(word.toUpperCase());
	System.out.println(word.charAt(1));
	
	
	
	
	
	
	}
}
