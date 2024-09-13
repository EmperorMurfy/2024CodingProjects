// Date: Sept 13, 2024
// Written by Mason Z.
// Array basics pt 2

// array contain/index finder - array basics #2

let array = [1, 2, 3]
print (array.contains(1))
let max: Int = array.max() ?? 0

print(max)

let index: Int = array.firstIndex(of: max) ?? 0

print(index)
