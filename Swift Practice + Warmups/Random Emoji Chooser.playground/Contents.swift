import Foundation
/*
 Create a new Playground named Random Emoji Chooser. You will write the class EmojiChooser in this playground.


 Class EmojiChooser should have one stored value, an array of emojis, and one method getRandomEmojis. This method will return an array of Strings which will be five random emoji’s, the 1st of which should be one of the vother four emoji’s in the list.:


 Int.random(0..<emojis.count)


 There should not be any duplicates in the array that you return, other than the first emoji, which as has already been mentioned should be one of the emoji’s that has already been added to the return array.


 After you have written your class, test it out in your playground by calling the getRandomEmojis method five times.
 */

class EmojiChooser {
    var emojis: Array<String>
    
    init(emojis: Array<String>) {
        self.emojis = emojis
    }
    
    func getRandomEmojis() {
        // 4 completely random emoji chooser
        var array = emojis
        
        var randomEmoji = [String]()

        for _ in 1...4 {
            let e: String = String(array.randomElement() ?? "🤯")
            randomEmoji.append(e)
            // add emoji into seperate Array
            
            let index = array.firstIndex(of: e) ?? 0
            array.remove(at: index)
            // find array, so that there is no repeats with removal
        }
        /*
        print(" ")
        print(randomArray)
        */

        // repeat emoji func
        let repeatEmoji = randomEmoji.randomElement() ?? "🤯"
        randomEmoji.append(repeatEmoji)

        print(randomEmoji)
            

            // example with nums:  ["4", "3", "6", "2"]
            
          

    }
}

var array = ["😃", "😃", "🍷", "🫸", "🔵", "🔴", "🫷", "🤌", "🫴", "🟣", "🤯", "😔", "🤔", "🤫", "🧏"]

var emoji1 = EmojiChooser(emojis: ["😃", "😃", "🍷", "🫸", "🔵", "🔴", "🫷", "🤌", "🫴", "🟣", "🤯", "😔", "🤔", "🤫", "🧏"])

print(emoji1.emojis) // print out emoji
print(emoji1.getRandomEmojis())


// 😀😃😄🗿🍷🫸🔵🔴🫷🤌🫴🟣🤯😔🤔🤫🧏
//🫸🔵🔴🗿🗿 3 different, 2 repeats.
