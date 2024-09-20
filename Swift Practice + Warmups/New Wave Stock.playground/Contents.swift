// Project : New Wave Stock [No Inputs]
// Written by: Mason Z
// Date: Sept 20, 2024
// Description: Non-input version. Original. - Kinda Rudimetary: Basic Demonstration of Dictionary's in Swift

/* TASK
1 - Add a product – The user will enter a product name and quantity. Make sure that they don’t accidently overwrite a product that is already in the database.
 
2 -  Add a quantity to an existing product – The user will enter a product name and quantity. This quantity should be added to the existing stock. The user should be notified if they enter an invalid product name.
 
3 - Remove a quantity from an existing product – The user will enter a product name and quantity. This quantity should be subtracted from the existing stock. The user should be notified if they enter an invalid product name or an invalid quantity.
 
4 - Total number of items in stock – Print the total quantity of items that New Wave Computers™ has in stock.
 
5 - List all items that are in stock – Print a nicely formatted table of all items currently in stock, sorted from items that have the highest quantity down to items that have the lowest quantity.
*/

import Foundation

// variables
var stock = ["hard drives": 502, "software": 7, "wPhones": 24, "wPens": 700532]


// because input on xcode doesn't work, this is the version where input is disabled and inputs are substituded with consts

// menu - defunct
print("************************************************************")
print("welcome to new wave computer systems - inputs off")
print("")



// #1
print("1 - Add Product")
print("For this purpose, we will add wTablets with a quantity of 2, as it is a new product")
print("")

if let product = stock["wTablets"] {
    print("ERROR: ALREADY EXISTS. CANNOT EXISTING ITEM AS NEW ITEM TO DATABASE") // in this casse, this error will not occur
} else {
    stock["wTablets"] = 2
}



// #2
print("2 - Add a Quantity to an Existing Product")
print("For This Purpose, 8 will added to hard drives. It shall equal 510 after.")
print("")

if let productQuantity = stock["hard drives"] {
    stock["hard drives"] = productQuantity + 8
} else {
    print("that product doesn't exist") // in this case, this error will not occur
}




// #3
print("3 - Remove a Quantity to an Existing Product")
print("For This Purpose, 5 will removed from software. It shall equal 2 after.")
print("")

if let productQuantity = stock["software"] {
    stock["software"] = productQuantity - 5
} else {
    print("that product doesn't exist") // in this casse, this error will not occur
}



// #4
var totalStock = 0
for quantity in stock.values {
    totalStock+=quantity
}
print("4 - Total # of Items in Stock = \(totalStock)")
print("")

// #5
print("5 - All Items in Stock Report")
print("")

print ("Product          Quantity")
for (product, quantity) in stock {
    print ("\(product)      \(quantity)")
}
print("")

print("************************************************************")




