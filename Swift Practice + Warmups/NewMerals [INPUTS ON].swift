// Project : Newmerals
// Written by: Mason Z
// Date: Sept 29, 2024
// Description: Newmerals + functions: join, promotion, mirror

import Foundation

// Start Screen
print("welcome to new wave computer systems")
print("Newmerals™ Software V1.0")
print(" ")

// Functions

// Join ":"
var join_closure : (String, String) -> String = {
    var str: String = ""
    let array1 = Array($0)
    let array2 = Array($1)
    
    for i in 0..<array1.count { // assuming array1.count = array2.count
    str.append(array1[i])
    str.append(array2[i])
    }
    
    return str
}

// Promote "^"
var promotion_closure : (String, String) -> String = {
    var str: String = ""
    let array1 = Array($0)
    let array2 = Array($1)
    
    if (array1 == array2) {
        for a in $0 {
             // a, b, c, d
            let compare: Array = ["A", "B", "C", "D"]
            
            
            let index = compare.firstIndex(of: String(a))! + 1
            
            if (index < 3) {
                str.append(compare[index])
                
            } else { // index of 4 - 0, 1, 2, 3, 4
                str.append("A")
            }
        }
        // place holder
    }
    
    else {
        for i in 0..<array1.count {
            var compare = [array1[i], array2[i]] // ["A", "C"]
            compare = compare.sorted(by: >)
            str.append(compare[0])
        }
    }
    
    return str
}

// Mirror "%"
var mirror_closure : (String, String) -> String = {
    return String($1.reversed()) + $0 + $1
}

// Menu 
var exit = 1

while (exit == 1) {
    print("************************************************************")
    print("1 - Access Newmeral Interface")
    print("0 - Exit Program")
    print("************************************************************")
    
    // input, prevent input of non integers w/ error
    var choice: Int = 0

    if let c = Int(readLine()!) {  
        choice = c
    }   
    
    else {
        print(" ")
        print("ERROR 422: Invalid Input Type - Integers Only.")
        
        choice = 0
    }
   
    // Options
    switch choice {
        case 0: // exit program
            print("exiting program...")
            exit = 0

        case 1: // Access Newmeral Interface
            print("")
            print("Please input: [Value] [Operator] [Value]")
            print("Note: Include spaces in between Values and Operator EX) AB : CD")
            
            let newmerals: String = readLine() ?? "AB : CD"

            if newmerals.isEmpty {
                print("Error 403: No Input Registered.")
            } 
            
            else {
                print(" ")
                let array = newmerals.split(separator: " ")
            
                let numeralsA: String = String(array[0].uppercased())
                let numeralsB: String = String(array[2].uppercased())
            
                if array[1] == ":" {
                    print("Resulted output:")
                    print(join_closure(numeralsA, numeralsB))
                } 
                
                else if array[1] == "^" {
                    print("Resulted output:")
                    print(promotion_closure(numeralsA, numeralsB))
                } 
                
                else if array[1] == "%" {
                    print("Resulted output:")
                    print(mirror_closure(numeralsA, numeralsB))
                } 
                
                else {
                    print("Error 408: Operation Type \(array[1]) Not Found.")
                }
            }
            
            default: 
                print(" ")
                print("Error 422: Enter a valid input as stated.")
    }
    
    print("")
    
}
