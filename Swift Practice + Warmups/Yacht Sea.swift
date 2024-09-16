// Project : Yacht Sea
// Written by: Mason Z
// Date: Sept 16, 2024
// Description: Yacht Sea - Missing "4 of a kind, Big Straight, and Choice" Detection. Original approach.
// note, full house will be recoded to use a set or dictionary instead of current approach as per goal - however, fully functional at said moment. 

// variables 
var highestScore: Int = 0 // highest score, default zero
var category: String = "default" // category default temp placeholder
var dice = [Int]()

for _ in 1...20 {
    var array = [Int]()

    // create random array
    for _ in 1...5 {
        let number = Int.random(in: 1...6)
        array.append(number)
    }
    
    // Yacht Sea - if all values is the same
    if (array.allSatisfy({ $0 == array.first }) == true) {
        highestScore = 50 // highest possible score
        category = "Yacht Sea"
        dice = array
    }
    
    // small straight
    let setArray: Set = Set(array)
    let c1: Set = [1, 2, 3, 4]
    let c2: Set = [2, 3, 4, 5]
    let c3: Set = [3, 4, 5 ,6]
    let comparison = [c1, c2, c3]
    
    for c in comparison {
    if (setArray == c && highestScore < 30) {
        highestScore = 30
        category = "Small Straight"
        dice = array
    }
    }
    
    // create an array that checks in the original "array" length of 5, for the values 1 through 6
    //           1  2  3  4  5  6
    var value = [0, 0, 0, 0, 0, 0]
    
    for i in 1...6 { // index 0
        for number in array {
            if (number == i) {
                value[i-1] += 1
            }
        }
    }
    
    if (value.contains(2) && value.contains(3) && highestScore < 25) {
        highestScore = 25
        category = "Full House"
        dice = array
    }
  
    for i in 1...6 { // get all the occurances worth their value, say 2 threes in an array? it'll now be 6. 
        value[i-1] *= i 
    }

    let max: Int = value.max() ?? 0  // find the max value in the value array
    let index: Int = value.firstIndex(of: max) ?? 0 // plus what index it was detected in.
    
    let numerals = ["Ones", "Twos", "Threes", "Fours", "Fives", "Sixes"]
    if (max > highestScore) {
        highestScore = max
        category = numerals[index]
        dice = array
    }
}
print("input: \(dice) | output: \(highestScore) | explanation: \(category)")
