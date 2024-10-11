// Project: The Culling Games
// Written by: Mason Z.
// Date: Oct 10, 2024
// Description:

// no domains for now.

// ✅ - working
// ⚠️ - Being Developed (may work, but is not finished)
// ❌ - Non-Functional or Error In Logic

// CE - Cursed Energy
// RCT - Reverse (Reversed) Curse Technique

/* Heavenly Restriction -
 Debuffs: No Cursed Energy (RCT), No Ult. Hollow Purple will one shot no matter what.
 Buffs:   Damage Absorbtion Increased - All attacks 75% of original damage
          Inital Health Increase compared to Regular Special Grade
 */

// Proposed additions: Domain Expansion/Domain Clashes, Six Eyes allow faster recovery of CE - higher percentage increase

import Foundation

// Player Class
class Player {
    // variables
    
    // stats
    var name: String
    var initialCursedEnergy: Double // 0 - 400
    var cursedEnergy: Double
    var cursedTechnique: [String: [Double]]
    
    // interactable
    var damage: Int
    var healing: Int
    var stun: Int
    
    // special characters
    var heavenlyRestriction = false
    // ⚠️ add six eyes - make CE recovery percentage rate larger
    
    // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action
    var status: Int { // ✅
        if (health < 0) {
            return -1
        } else {
            return stun
        }
    }
    
    
    // based on original set CE - constant computed property
var grade: Int {
    let ranks = [4, 3, 2, 1, 0] // 0 = Special Grade
    if (initialCursedEnergy == 0) { // Heavenly Restriction - Automatically Buffs
        heavenlyRestriction = true
        return ranks[4]
    } else {
        var index = initialCursedEnergy/100.0
        index.round(.toNearestOrAwayFromZero)
        return ranks[Int(index)] // rounds up, take 384.1 - will turn that into a grade 0
    }
}
    
    // amount of health - updates when changed
    var health: Int {
        return heavenlyRestriction ? ((125 - grade * 25) + healing + 35) - Int(0.75 * Double(damage)) : ((125 - grade * 25) + healing) - damage
    }
    
    
    // constructor - initalizer
    init(name: String = "default", cursedEnergy: Double = 10.0, cursedTechnique: [String : [Double]] = ["Reversal Red": [20.0, 0.0], "Lapse Blue": [5.0, 3.0], "Hollow Purple": [45.5, 2.0]], damage: Int = 0, healing: Int = 0, stun: Int = 0) {
        self.name = name
        self.cursedEnergy = cursedEnergy
        self.cursedTechnique = cursedTechnique
        self.damage = damage
        self.healing = healing
        self.stun = stun
        self.initialCursedEnergy = cursedEnergy // remains the same as original input. so CursedTechnique can change while this will remain the same.
    }
    
    // when called, will choose either techniques() (cursedTechnique - attack) or reverseCurseTechnique() (RCT - heal function) -> Return
    func action() -> (damage: Int, stun: Int, report: String) { // ✅
        var choice = 1
        let maxHealth = maxHealth()
        
        if (grade < 2 && Int(cursedEnergy) != 0 && Int(initialCursedEnergy) != 0 && maxHealth != health && heavenlyRestriction == false) {
            // must be grade 1 or up, must have more than 0 cursedEnergy, cannot have heavenly restriction, if health is 100%, won't get heal
            choice = Int.random(in: 1...2)
        }
        
        var actions = (damage: 0, stun: 0, report: "")
        
        if (choice == 1) {
            actions = techniques()
        }
        
        else if (choice == 2) {
            //Heal - random value between 75% of all current cursed energy to 5% of all current cursed energy - 1HP translates to around 1.2 cursed energy
            
            let report = reverseCurseTechnique() // used amount of RCT
            actions = (0, 0, report) // deal no damage
        }
        return actions
    }
    
    
    // when called in Action() -> random value of current CE (50% - 5%) -> convert 1.2 CE to 1HP -> add to health (heal)
    func reverseCurseTechnique() -> String { // ✅
        let usedCE = Double.random(in: (0.2 * cursedEnergy)...(0.5 * cursedEnergy))
        cursedEnergy -= usedCE
        let healAmount: Int = Int(usedCE/1.2)
        let maxHealth = maxHealth() // remove that amount of cursed energy
        // (100 - 50) = 50 > 30
        
        // 70 + 50 = 120
        healing += healAmount
        let report = "RCT: \(healAmount) HP"
        
        if (health > maxHealth) { // remove excess amount of health -> 70 + 50 = 120
            // -> 120 set back to 100 (example original health)
            let excess = health - maxHealth // excess
            cursedEnergy += Double(excess) * 1.2
            healing = healing-excess // remove excess
        }
        return report
    }
    
    
    // when called in Action() -> sees if black flash is possible [yes, reture] - (no continue) > select a random technique -> check if enough CE (if not, reroll) - (yes) > return technique
    func techniques() -> (damage: Int, stun: Int, report: String){ // ✅
        var technique = (0, 0, "")
        
        // cursedTechnique: ["Reversal Red": [20.0, 0.0], "Lapse Blue": [5.0, 3.0], "Hollow Purple": [45.5, 2.0]]
        if (grade < 3 && Int.random(in: 0...1000000) == 271) { // BLACK FLASH
            technique = (71, 4, "ϐׁׅ֒ᥣׁׅ֪ɑׁׅ֮ᝯׁƙׁׅ֑ ⨍ᥣׁׅ֪ɑׁׅ֮꯱ׁׅ֒hׁׅ֮!!!")
        } else {
            let attacks = Array(cursedTechnique.keys) // create array of attacks

            let attack = attacks.randomElement() // select random attack

            if let attack = attack { // if attack not null
                let attackStats = cursedTechnique[attack] // attackStats (damage, stun, cursedEnergy needed)

                if let attackStats = attackStats { // if attackstats not null
                    let CECost = attackStats[2] // check amount of CE required

                    if CECost <= cursedEnergy { // if enough, return
                        technique = (Int(attackStats[0]), Int(attackStats[1]), attack)
                        cursedEnergy -= CECost // take amount needed.
                    } else { // if not enough, reroll.
                        technique = techniques() // if we roll an ult, and don't have enough.
                    }
                }
            }
        }
        return technique
    }
        
    // return maxHealth possible
    func maxHealth() -> Int { // ✅
        if (heavenlyRestriction == true) {
            return (125 - grade * 25) + 35
        } else {
            return 125 - grade * 25
        }
    }
    
    // replenish CE by adding a certain percentage of initial CE to current CE
    func replenishCE() { // 380 < 400 ✅
        if (cursedEnergy < initialCursedEnergy) {
            cursedEnergy+=0.05*initialCursedEnergy // 5% of original CE
            if (cursedEnergy > initialCursedEnergy) { // overflow preventable
                cursedEnergy = initialCursedEnergy
            }
        }  // all other condition is that 400 = 400 - cursed energy level is fine
    }
        
    // individual player report
    func statusReport() -> String { // ✅
        // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action
        if (status > 0) {
            return "Currently knocked out for \(status) rounds + \(health) HP Left"
        } else if (status == -1){
            return "Terminated"
        } else {
            return "Currently alive with \(health) HP left"
        }
    }
    
    // return cursedEnergypercentage - converts Int CE to % in comparison to initial CE
    func cursedEnergyPercentage() -> String { // ✅
        if (initialCursedEnergy == 0) {
            return "Heavenly Restriction - No Cursed Energy"
        }else {
            return "Cursed Energy Lvl: \(Int(100*(cursedEnergy/initialCursedEnergy)))%"
        }
    }
    
    // converts Int Grade to String Grade
    func ranking() -> String { // ✅
        var rank: String = ""
        if (grade == 0) {
            rank.append("Special Grade")
        } else {
            rank.append("Grade \(grade)")
        }
        return rank
    }
}




// Team Class
class Team {
    // variables
    var name: String
    var players: [Player]
    
    var activePlayers: [Player] {
        var active = [Player]()
        for player in players {
            if (player.status == 0) {
                active.append(player)
            }
        }
        return active
    }
    
    init(name: String, players: [Player]) {
        self.name = name
        self.players = players
    }
    
    // recover cursed
    func recover() { // ✅
        for player in players {
            player.replenishCE() // recover cursedEnergy after
            if (player.stun > 0) {
                player.stun -= 1
            }
        }
    }
    
    func turn() -> (damage: Int, stun: Int, report: String) { // ✅
        // output a certain damage, stun, and report: (heal, attack: "ability")
        let randomPlayer = activePlayers.randomElement()!
        let result = randomPlayer.action()
        recover()
        
        return (damage: result.damage, stun: result.stun, report: "\(randomPlayer.name) - \(result.report)")
        
    }
    
    
    func receive(damage: Int, stun: Int, report: String) {
    // check if win or lost, take the damage
    
    let randomPlayer = activePlayers.randomElement()! // pick random player
    print("")
    print(report) // ex: Satoru Gojo - Hollow Purple
    print("Delt \(damage) HP \(randomPlayer.name)")
    print("Stunned for \(stun) rounds")
    print("")

    if (randomPlayer.heavenlyRestriction == true && report == "Satoru Gojo - Hollow Purple") { // heavenlyRestriction - hollow purple guaranteed one shot.
        randomPlayer.damage = 100000
        randomPlayer.stun = -1
    } else {
        randomPlayer.damage = damage
        randomPlayer.stun = stun
    }
    teamReport() // report stats

    for player in players {
        player.replenishCE()
    }
}
    
    func isDead() -> (state: Bool, report: String) {
        for player in players { // check for any stunned player in roster
            if (activePlayers.isEmpty) {
                if (player.stun > 0) {
                    return (true, "- ᴏᴜᴛ ᴏꜰ ᴄᴏᴍᴍᴍɪꜱɪᴏɴ")
                } else {
                    return (true, "- ᴇʟɪᴍɪɴᴀᴛᴇᴅ")
                }
            }
        }
        return (false, "")
    }
    
    // team info: name, grade, status (health, stun), cursed energy
    func teamReport() { // ✅
        var names = [String]()
        for player in players { // add to list
            names.append("\(player.name): \(player.ranking()) Sorcerer\nStatus: \(player.statusReport())\n\(player.cursedEnergyPercentage()) \n")
        }
        print("************************************************************")
        print("\(name) Roster Report \n\n\(names.joined(separator: "\n"))") // change this for better visuals
        print("************************************************************")
    }
}


// Players - Passive, Two Abilities, One Ult

// they recover their cursed energy immediately, increase cursedEnergy usage by 0.05 + x

//

// Special Grades (125) - No damage may exceed 80
let gojoSatoru = Player(name: "Satoru Gojo", cursedEnergy: 400.00, cursedTechnique: ["Rapid Punches": [14, 0, 0], "Reversal Red": [20, 0, 55], "Lapse Blue": [15, 3, 45], "Hollow Purple": [70, 4, 140]]) //

let sukunaRyomen = Player(name: "Ryomen Sukuna", cursedEnergy: 395, cursedTechnique: ["Slashes": [12, 0, 0], "Dismantle": [24, 0, 60], "Cleave": [18, 2, 52], "Open...Divine Flame": [65, 6, 135]])

// something broken with being 0.0 CE
let fushiguroToji = Player(name: "Toji Fushiguro", cursedEnergy: 0.0, cursedTechnique: ["splitSoulKatana": [20, 0, 0], "invertedSpearofHeaven": [18, 2, 0], "Pistol": [28, 2, 0]]) // no ult

// Grade 1 (100)- No Damage may exceed 65
let itadoriYuji = Player(name: "Yuji Itadori", cursedEnergy: 335.00, cursedTechnique: ["Cursed Tool: Slaughter Demon": [10, 0, 0], "Divergent Fist": [22, 0, 0], "Piercing Blood": [16, 2, 0], "Dismantle": [30, 1, 70]])


// Grade 2 (75) - No Damage may exceed 45

// NO ULTS
// Grade 3 (50) - No Damage may exceed 18

// Grade 4 (25) - No Damage may exceed 10

let team1 = Team(name: "ɢᴏᴊᴏ", players: [gojoSatoru, sukunaRyomen]) // ꜱᴜᴘᴇʀ ꜱᴇɴɪᴏʀ ɢᴏᴊᴏ
let team2 = Team(name: "ᴛᴏᴋʏᴏ ᴊᴜᴊᴜᴛꜱᴜ ʜɪɢʜ", players: [itadoriYuji, fushiguroToji])


print("ᴀʀᴇ ʏᴏᴜ ʟɪꜱᴛᴇɴɪɴɢ? ꜱᴜᴋᴜɴᴀ...\n")
team1.teamReport()
print("")
print("...ɪᴛ'ꜱ ᴀʙᴏᴜᴛ ᴛᴏ ʀᴇᴛᴜʀɴ ᴀɢᴀɪɴ...\n")
team2.teamReport()
print("")
print("...ᴛʜᴇ ɢᴏʟᴅᴇɴ ᴇʀᴀ ᴏꜰ ꜱᴏʀᴄᴇʀʏ.")

var rounds = 20
var victor = ""
var mode = 1
var totalRounds: Int = 0

for round in 1...rounds {
    totalRounds += 1
    print("")
    if (mode == 1) {
        if (team1.isDead().state == true) { // check if offense is dead
            victor = "\(team2.name) ᴡᴏɴ.\n\n\(team1.name) \(team1.isDead().report)"
            break
        }
        
        print("\n____________________________________________________")
        print("𝐑𝐎𝐔𝐍𝐃 \(round)")
        let turn = team1.turn()
        team2.receive(damage: turn.damage, stun: turn.stun, report: turn.report)
        
    } else if (mode == -1) {
        if (team2.isDead().state == true) { // check if offense is dead
            victor = "\(team1.name) ᴡᴏɴ.\n\n\(team2.name) \(team2.isDead().report)"
            break
        }
        
        print("\n____________________________________________________")
        print("𝐑𝐎𝐔𝐍𝐃 \(round)")
        let turn = team2.turn()
        team1.receive(damage: turn.damage, stun: turn.stun, report: turn.report)
    }
    mode *= -1
    print("")
}


if (victor == "") {
    print("\(team1.name) tied with \(team2.name)\n\n")
} else {
    print("ꜱᴏ ᴛʜɪꜱ ᴍᴇᴀɴꜱ...")
    print("ʏᴇᴀʜ.")
    print("\(victor)\n\n")
}

print("Stats: ")
print("Total Rounds Elapsed - \(totalRounds-1)")
 
