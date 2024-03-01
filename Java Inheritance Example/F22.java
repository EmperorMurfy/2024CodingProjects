// F22.java
// Project: Java Inheritance Example
// Name: Mason Z.
// Date: Feb 29, 2024
// Description: Child Class of Aircraft
public class F22 extends Aircraft{ // The "Extends" - Subclass (Child Class) inherits the Super Class (Parent Class) 
// However, still can hold it's own unique methods without interfering or inherited by other subclasses or the super class
	public void getName() {
		System.out.println("Purchaced ONE Lockheed Marin- F-22 Raptor");
	}
	
	// overrides engineOff() method from Aircraft
	public void engineOff() {
		super.engineOff();
		System.out.println("systems offline");
	}
}
