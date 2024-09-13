// Project : Yacht Sea
// Written by: Mason Z
// Date: Sept 13, 2024
// Description: Yacht Sea - Missing "4 of a kind, Big Straight, and Choice" Detection. Original approach.
// note, full house will be recoded to use a set or dictionary instead of current approach as per goal - however, fully functional at said moment. 

var highestScore: Int = 0 // highest score, default zero
var category: String = "default" // category default temp placeholder
var dice = [Int]()

for _ in 1...20 {
    var array = [Int]()
    // var sum: Int = 0

    // create random array
    for _ in 1...5 {
        let number = Int.random(in: 1...6)
        array.append(number)
    }
    
        // testing elements - removal is ok
  //  print("Original Dice Roll")
  //  print(array)

    
    // a Yacht Sea is where all values in the Array are equal values
    if (array.allSatisfy({ $0 == array.first }) == true) {
        highestScore = 50 // highest possible score
        category = "Yacht Sea"
        dice = array
    }
    
    else if (array == [1, 2, 3, 4, 5] && highestScore < 30) { // conditions, if array fufills small straight, and that there isn't a higher score
        highestScore = 30
        category = "Small Straight"
        dice = array
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

    // testing elements - removal is ok
 //   print("occurance")
 //  print(value)
    
    if (value.contains(2) && value.contains(3) && highestScore < 25) {
        highestScore = 25
        category = "Full House"
        dice = array
    }
  
    // get all the occurances worth their value
    for i in 1...6 {
        value[i-1] *= i 
    }
     // testing elements - removal is ok   
  //  print("value")
   // print(value)
   // print("")
    
    // find the max
    let max: Int = value.max() ?? 0
    let index: Int = array.firstIndex(of: max) ?? 0
    
   let numerals = ["Ones", "Twos", "Threes", "Fours", "Fives", "Sixes"]
    if (max > highestScore) {
        highestScore = max
        category = numerals[index]
        dice = array
    }
}
print("input: \(dice) | output: \(highestScore) | explanation: \(category)")


