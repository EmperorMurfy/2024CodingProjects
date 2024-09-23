// Project : NW Stock [INPUT ENABLED]
// Written by: Mason Z
// Date: Sept 20, 2024
// Description: Input enabled version. Coded in Programiz (Xcode has issues with allowing inputs in Console) Modifed Version of Original - NW Stock = New Wave Stock

import Foundation

// variables
var stock = ["hard drives": 502, "software": 7, "wPhones": 24, "wPens": 700532]
var exit = 1

// produce inventory at launch - starting screen
print ("Product          Quantity")
let sortStock = stock.sorted(by: { $0.value > $1.value })

for (product, quantity) in sortStock {
    print ("\(product)      \(quantity)")
}

print(" ")
print("loading...")
print(" ")
print("welcome to new wave computer systems")
print(" ")

while (exit == 1) {
    // menu
    print("************************************************************")
    print("1 - Add Product")
    print("2 - Add a Quantity to an Existing Product")
    print("3 - Remove a Quantity to an Existing Product")
    print("4 - Total # of Items in Stock")
    print("5 - All Items in Stock Report")
    print("0 - EXIT")
    print("************************************************************")
    
// input, prevent input of non integers w/ error
   var choice: Int = 0
   
   if let c = Int(readLine()!) {
    choice = c
   }   
   else {
     print(" ")
     print("ERROR 422: Invalid Input Type - Integers Only.")
     choice = 9
   }
   
    print("")
    switch choice {
        case 0: // exit program
            print("exiting program...")
            exit = 0
            
        case 1: // add product
            print("Enter Product Name")
            let productName: String = readLine() ?? "default"
            print("Enter the quantity of \(productName)")
            let productQuantity: Int = Int(readLine()!) ?? 0 
            print(" ")
            
            if productQuantity < 0 {
                print("ERROR 422: New Product \(productName) cannot have negative quantity.")
            }
            
            else {
                if let quantity = stock[productName] { 
                    print("ERROR 403: \(productName) with a quantity of \(quantity) already exists.") 
                }
            
                else { 
                  stock[productName] = productQuantity 
                }
            }
            
        case 2: // add quantity to existing product
            print("Enter Product Name")
            let productName: String = readLine() ?? "default"
            print("Enter amount added")
            let addedQuantity: Int = Int(readLine()!) ?? 0 
            print(" ")
        
                
            if let productQuantity = stock[productName] {
                if addedQuantity < 0 {
                    print("ERROR 422: Cannot add negative quantity to \(productName)")
                } else {
                stock[productName] = productQuantity + addedQuantity
                }
            } else {
                print("ERROR 404: \(productName) doesn't exist.")
            }
            
            
        case 3: // remove quantity to existing product
            print("Enter Product Name")
            let productName: String = readLine() ?? "default"
            print("Enter amount removed")
            let removedQuantity: Int = Int(readLine()!) ?? 0 
            print(" ")
            
            if let productQuantity = stock[productName]{
                if removedQuantity < 0 {
                    print("ERROR 422: Cannot remove a negative quantity from \(productName)")
                }
                stock[productName] = productQuantity - removedQuantity
            } else {
                print("ERROR 404: \(productName) doesn't exist.")
            }
            
            
        case 4: // Total # of Items in Stock
            var totalStock = 0
            
            for quantity in stock.values {
                 totalStock+=quantity
            }
            
            print("Total Items in Stock = \(totalStock) ")
            
            
        case 5: // All items in Stock Report
        
            let sortStock = stock.sorted(by: { $0.value > $1.value })
            
            print ("Product          Quantity")
            
            for (product, quantity) in sortStock {
                 print ("\(product)      \(quantity)")
            }
            
            
        default: // ERROR 422: INVALID INPUT OPTION
            print(" ")
            print("Please select an acceptable choice 1-5 or [0] to exit")
    }
    print(" ")
}
