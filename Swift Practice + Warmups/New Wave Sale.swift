// Project : New Wave Sale
// Written by: Mason Zhu
// Date: Sept 9, 2024
// Description: Written in the packet, page 33 + 34

import Foundation

// hard drives, software packages, wPhones, wPens


print("New Wave Computers™ Calculator")
print("Input the Amount of Product Via Numeral Values")
print("___________")
print("")

print("Please enter your name:")
let name: String = readLine() ?? "Default Name"

// hard drives
print("How many Hard Drives would you wish to purchace?")
let countDrive: Int = Int(readLine()!)!
var hardDrive: Double = Double(countDrive)

// conditions - hard drives
if (hardDrive < 5) { // less than 5 hard drives
hardDrive = 49.95*hardDrive
}

else if (hardDrive >= 5 && hardDrive < 10) {
hardDrive = 47.4525*hardDrive
}

else {
    hardDrive = 44.955*hardDrive
} // is the discount apply to EACH hard drive respectively, or combined?

// software + wPhones
print("How many software packages would you like to purchase?")
let countWare: Int = Int(readLine()!)!
var software: Double = 25 * Double(countWare)



print("How many wPhones would you like to purchase?")
let countPhones: Int = Int(readLine()!)!
var wPhones: Double = Double(countPhones)

// conditions - software + wPhones
if (software - (wPhones * 10.0) < 0) {
    software = 0
}

else {
software = software - (wPhones * 10.0)
}

wPhones = wPhones * 399.0


print("How many wPens would you like to purchase?")
let countPens: Int = Int(readLine()!)!
var wPens: Double = Double(countPens)

// conditions - pens
if (wPens < 5) {
    wPens = 500.0 - ((wPens-1)*50.0)
}

else {
    wPens = 300
}

// tax + preTax
let preTax = hardDrive + software + wPhones + wPens
let tax = 0.6*preTax

// output

// how to format?
print("************************************************************")
print("New Wave Computers")
print("Customer: \(name)")
print("")
print ("Quantity      Item                                  Cost   ")
print("\(countDrive)          Hard Drives                  \(hardDrive)")
print("\(countWare)         Software                      \(software)")
print("\(countPhones)         wPhones                       \(wPhones)")
print("\(countPens)         wPens                         \(wPens)")
print("")
print("                    SUB TOTAL                   $. \(preTax)")
print("                    TAX                   $. \(tax)")
print("                    TOTAL                   $  \(preTax + tax)")

print("************************************************************")
