// Project : Newmerals
// Written by: Mason Z
// Date: Sept 27, 2024
// Description: Newmerals + functions: join, promotion, mirror

import Foundation

// variables

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

var mirror_closure : (String, String) -> String = {
    return String($1.reversed()) + $0 + $1
}


// join ':'
print(join_closure("AB", "CD")) // join function - Print ACBD

// promotional '^'
print(promotion_closure("ABC", "CDB")) // different newmerals - Print CDC
print(promotion_closure("AD", "AD")) // same newmerals - Print BA

// mirror '%'
print(mirror_closure("CD", "AD")) // DACDAD

print(mirror_closure("ABC", "721")) // Expected Result: 127ABC721 Actual Result:
