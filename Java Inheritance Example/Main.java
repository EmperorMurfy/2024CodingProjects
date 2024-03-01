// Main.java
// Project: Java Inheritance Example
// Name: Mason Z.
// Date: Feb 29, 2024
// Description: main class 

import java.util.ArrayList;

public class Main {
	public static void main (String[] args) { 
		// Inheritance - It is where another class obtains or INHERITS the attributes & methods of another
		
	    // create two f16 and f22 objects respectively 
		F16 fighterOne = new F16();
		F22 fighterTwo = new F22();
		
		fighterOne.getName(); // method only of it's specific subclass
		fighterOne.engineStart(); // method of masterclass used in subclass of F16 
		fighterTwo.getName(); // poor demonstration however, as this very job can be replaced with inhertiance, removing the need for both to HAVE unique methods 
		fighterTwo.engineOff(); // method of f22 which overridden the same method with the same name in aircraft
		
		
		fighterOne.mountMissiles(10); // unqiue method to f16, mounts 10 missiles to amount of total missiles
		System.out.println(fighterTwo.fuelLevel); // return current fuel level of f22 using method of superclass
		

		ArrayList<Aircraft> planes = new ArrayList<Aircraft>(); //can add any object that inherited aircraft to planes array
		// so f16, f22, and aircraft would all work in this class
		
		planes.add(fighterOne); // adds a f16 to planes array
		planes.add(fighterTwo); // adds a f22 to planes array
		planes.add(new Aircraft()); // creates a new Aircraft object via default constructor and adds to planes array
		
		
		
		
		
		
	}

}
