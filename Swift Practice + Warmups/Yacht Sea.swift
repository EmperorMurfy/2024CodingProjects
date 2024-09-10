// Project : Yacht Sea
// Written by: Mason Zhu
// Date: Sept 9, 2024
// Description:

// work in progress

var highestScore: Int = 0 // highest score, default zero

for _ in 1...20 {
var array = [Int]()


for _ in 1...5 {
    let number = Int.random(in: 1...6)
    array.append(number)
}

// a Yacht Sea is where all values in the Array are equal values
print("Array \(array) Yacht Sea Checker: \(array.allSatisfy({ $0 == array.first }))")


}


