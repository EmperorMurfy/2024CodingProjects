// Project : Random Emoji Chooser
// Written by: Mason Z
// Date: Sept 30, 2024
// Description: Create a class Emoji Chooser w/ getRandomEmoji() function. 4 random (no repeats), 5th value (technically first value) will be a repeat of a emoji that has already been added. Ex: ["🤌", "🤯", "😃", "🫷", "🤌"]

import Foundation

// class 
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
             // add emoji into seperate Array
            let e: String = String(array.randomElement() ?? "🤯")
            randomEmoji.append(e)
            
            // find array, so that there is no repeats with removal
            let index = array.firstIndex(of: e) ?? 0
            array.remove(at: index)
        }
    
        // repeat emoji func
        let repeatEmoji = randomEmoji.randomElement() ?? "🤯"
        randomEmoji.insert(repeatEmoji, at: 0)
        
        print(randomEmoji) // return output
    }
}


// Initalize a Emoji Chooser Object and run getRandomEmojis 5 times

// emoji array which stores emojis. 
// note: also an option to directly input it instead without a constant. 
let array = ["😃", "😃", "🍷", "🫸", "🔵", "🔴", "🫷", "🤌", "🫴", "🟣", "🤯", "😔", "🤔", "🤫", "🧏"]

var emoji1 = EmojiChooser(emojis: array)
//print(emoji1.emojis) // print out emoji

// calls getRandom Emoji Function 5 times
for _ in 1...5 {
    print(emoji1.getRandomEmojis())
}
