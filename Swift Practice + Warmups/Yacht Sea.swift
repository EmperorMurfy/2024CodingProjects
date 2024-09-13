// Project : Yacht Sea
// Written by: Mason Zhu
// Date: Sept 13, 2024
// Description:

// work in progress

var highestScore: Int = 0 // highest score, default zero
var category: String // category


for _ in 1...20 {
    var array = [Int]()
    // var sum: Int = 0

    // create random array
    for _ in 1...5 {
        let number = Int.random(in: 1...6)
        array.append(number)
    }
    
    // test
    print(array)
    
    // a Yacht Sea is where all values in the Array are equal values
    if (array.allSatisfy({ $0 == array.first }) == true) {
        highestScore = 50 // highest possible score
        category = "Yacht Sea"
    }
    
    else if (array == [1, 2, 3, 4, 5] && highestScore < 30) { // conditions, if array fufills small straight, and that there isn't a higher score
        highestScore = 30
        category = "Small Straight"
    }
    
    // create an array that checks in the original "array" length of 5, for the values 1 through 6

    var value = [0, 0, 0, 0, 0, 0]
    
    for i in 1...6 { // index 0
        for number in array {
            if (number == i) {
                value[i-1] += 1
            }
        }
    }
    
    print("value")
    print(value)
    print("")
    
    
    
    
    // print("Array \(array) Yacht Sea Checker: \(array.allSatisfy({ $0 == array.first }))") // false if unfufilled
    
    


    
/*
var value = [Int]()
    

for n1 in array {
    let i = n1
    var sum: Int = 0
    
    // what if you instead removed elements, then find out how many numbers you are missing, that will be how many OCCURANCES happens. and you won't have more.
    for n2 in array {
        if (n2 == i) {
            sum += 1
        }
    }
    
    array.removeAll(where: { $0 == i }) // remove all occurances of i
    value.append(sum)
        
}
                    
print(value)
    
*/

}

print("highest score \(highestScore)")


