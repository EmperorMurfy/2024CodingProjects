// Date: Sept 6, 2024
// Written by Mason Z. 


var sequence = [1, 2, 0, 3, 4]

var sea: Set = Set(sequence)

// full straight
sequence = sequence.sorted()
print (sequence)

let c1: Set = [1, 2, 3, 4]
let c2: Set = [2, 3, 4, 5]
let c3: Set = [3, 4, 5 ,6]

var comparison = [c1, c2, c3]

for c in comparison {
if (sea == c) {
    print("yay")
}
}
