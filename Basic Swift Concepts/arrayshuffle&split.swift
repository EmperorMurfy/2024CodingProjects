var array = [1, 2, 3, 4, 5, 6, 7, 8]
array.shuffle()

let middleIndex = array.count / 2

var t1 = array[0..<middleIndex]
var t2 = array[middleIndex...]


for n in t1 {
    print(n)
}
print("")
for n in t2 {
    print(n)
}