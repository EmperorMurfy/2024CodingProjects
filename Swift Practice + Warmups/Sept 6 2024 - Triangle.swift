// declare a variable named base of type Int
print("base?")
let base: Int = Int(readLine()!)!

// do the same thing with height
print("height?")
let height: Int = Int(readLine()!)!

// declare a constant named area and set it equal to 1/2 base * height

let area: Double = 0.5 * Double(base*height)
 
// print out a sentence 

print("The area of a triangle with a base = \(base) and a height = \(height) is \(area)")