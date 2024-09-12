var number: Int = 9
var optionalNumber: Int? = nil
var total: Int

// set total = number + optionalNumber

// forced unwrapping
// total = number + optionalNumber!
// print(total)

// optional binding
if let unwrappedNumber = optionalNumber {
    total = number + unwrappedNumber
    print(total)
} else {
    print("\"\(optionalNumber)\" could not be unwrapped to an Integer")
}


    





