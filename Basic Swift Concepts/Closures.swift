// Date: Sept 26, 2024
// Written by Mason Z.
// Closures

// in-class Closures + classes

import Foundation

//#1 - Original Attempt
// (Int, Int) - > Int
func maximum(num1: Int, num2: Int) -> Int {
    return (num1 > num2) ? num1 : num2 //  return max(num1, num2)
}

// test
print(maximum(num1: 1, num2: 2)) // return 2
var number: Int = 8



// maximum written as a closure
var maximum_closure: (Int, Int) -> Int = {
    (num1: Int, num2: Int) -> Int in
    return (num1 > num2) ? num1 : num2
}

// closure types can be inferred
var maximum_closure_2 = {
    (num1: Int, num2: Int) -> Int in
    return (num1 > num2) ? num1 : num2
}

// return statement can be inferred if there is only one statement in the closure
var maximum_closure_3 = {
    (num1: Int, num2: Int) -> Int in
        (num1 > num2) ? num1 : num2
}

// parameters can be inferred!
var maximum_closure_4: (Int, Int) -> Int = {
    return ($0 > $1) ? $0 : $1
}


//#2 - Original Attempt
func alpha_concat(array: [String]) -> String {
    var strings = array
    strings.sort()
    // sorts
    
    var output: String = ""
    
    for string in strings {
        output += string
    }
    return output
}

// alpha_concat as closure
var alpha_concat_closure: ([String]) -> String = {
    (array: [String]) -> String in
    
    var strings = array
    strings.sort()
    // sorts
    
    var output: String = ""
    
    for string in strings {
        output += string
    }
    return output
}

// rewrite this function with the parameters inferred
var alpha_concat_closure_2: ([String]) -> String = {
    var output: String = ""
    
    for string in $0.sorted() {
        output += string
    }
    return output
}

// test
var arrayString = ["cat", "dog", "bird"]
print(alpha_concat(array: arrayString))



// #3 - Original Attempt
func average(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}

//test
print(average(1, 2, 3, 4, 5)) // returns 3.0


// rewrite the average function as a closure with inferred parameters
var average_closure: (Double...) -> Double = {
    var total: Double = 0
    for number in $0 {
        total += number
    }
    
    return total / Double($0.count)
}

// print(average_closure(1, 2, 3, 4, 5)) //testing average_closure with same value (1, 2, 3, 4, 5)




var numbers = [10, 12, -9, 4, 5, 16, 7, 0, 9, 10]
print(numbers.sorted())

func sort_numbers(number1: Int, number2: Int) -> Bool {
    return number1 > number2
}

// type and parameters are inferred
var sort_numbers_closure = {
    (number1: Int, number2: Int) -> Bool in
    return number1 > number2
}

var sort_numbers_closure_2: (Int, Int) -> Bool =  {
    return $0 > $1
}

print(numbers.sorted(by: sort_numbers_closure)) // using closure

print(numbers.sorted(by: sort_numbers(number1: number2:))) // print(numbers.sorted(by: (Int, Int) throws -> Bool))




// write a function w/ two parameters, an array of String and a function, or closure of type ([String]) -> String
// the function will process the words in the array according to the closure and then print the results.


func printProcessedWords(words: [String], processing: ([String]) -> String) {
    let processed = processing(words)
    print(processed)
}

let animals = ["cat", "dog", "bird"]
// printProcessedWords(words: animals, processing: alpha_concat(words:))

printProcessedWords(words: animals, processing: alpha_concat_closure)


printProcessedWords(words: animals, processing: {
    (array: [String]) -> String in
    var strings = array
    strings.sort()
    // sorts

    var output: String = ""

    for string in strings {
        output += string
    }
    return output
})


class Student{
    var name: String
    var age: Int
    var gpa: Double
    
    // initializers
    init(name: String, age: Int, gpa: Double) {
        self.name = name // vs java, not "this." but "self."
        self.age = age
        self.gpa = gpa
    }
}

func findBestStudent(students: [Student], compare_function:(Student, Student) -> Bool) -> Student{
    var bestStudent = students[0]
    
    for student in students {
        if compare_function(student, bestStudent){
            bestStudent = student
        }
    }
    
    return bestStudent
}

var compareStudents : (Student, Student) -> Bool = {
    $0.gpa > $1.gpa //? $0 : $1
}

let set6 = [Student(name: "Marcus", age: 16, gpa: 2.1),
            Student(name: "Steve", age: 18, gpa: 3.0),
            Student(name: "Neal", age: 21, gpa: 1.0)
]

var theBest = findBestStudent(students: set6, compare_function:compareStudents)

print(theBest.name)

theBest = findBestStudent(students: set6, compare_function: {
    $0.name > $1.name
})

print(theBest.name)

// trailing closure syntax
theBest = findBestStudent(students: set6) {
    $0.age > $1.age
}

print(theBest.name)
