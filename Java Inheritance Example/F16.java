// F16.java
// Project: Java Inheritance Example
// Name: Mason Z.
// Date: Jan 9, 2024
// Description: Subclass (Child Class) of Aircraft with unique getName() 
public class F16 extends Aircraft{ // The "Extends" - Subclass (Child Class) inherits the Super Class (Parent Class) 
	int missiles;
	
	public void getName() {
		System.out.println("Purchaced ONE General Dynamics - F-16 Falcon");
	}
	
	
	public void mountMissiles(int amount) {
		missiles += amount;
		System.out.println("UPDATED INVENTORY: Total Missiles Mounted: " + missiles);
	}

}
