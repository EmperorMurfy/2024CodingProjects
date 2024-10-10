// Project: Fantasy Team Manager Project - Beta JujutusuKaisenFantasy
// Written by: Mason Z.
// Date: Oct 8, 2024
// Description: Beta Test to get Ideas and Concepts Done.

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

import Foundation

class Player {
    var name: String
    var initialCursedEnergy: Double // 0 - 400
    var cursedEnergy: Double
    var cursedTechnique: [String: [Double]]
    
    var damage: Int
    var healing: Int
    var stun: Int
    
    var heavenlyRestriction = false // ✅
    
    var status: Int { // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action ✅
        if (health < 0) {
            return -1
        } else {
            return stun
        }
    }

    var grade: Int { // based on original set CE - doesn't change after set ✅
        let ranks = [4, 3, 2, 1, 0] // 0 = Special Grade
        if (initialCursedEnergy == 0) { // Heavenly Restriction - Automatically Buffs
            heavenlyRestriction = true
            return ranks[4]
        }
        else {
            return ranks[Int(round(initialCursedEnergy/100.0))] // rounds up, take 384.1 - will turn that into a grade 0
        }
    }
    
    var health: Int { // amount of health - updates when changed ✅
        if (heavenlyRestriction == true) {
            ((125 - grade * 25) + healing + 35) - Int(0.75 * Double(damage))
        }
        else {
            ((125 - grade * 25) + healing) - damage
        }
    }
    
    init(name: String = "default", cursedEnergy: Double = 10.0, cursedTechnique: [String : [Double]] = ["Reversal Red": [20.0, 0.0], "Lapse Blue": [5.0, 3.0], "Hollow Purple": [45.5, 2.0]], damage: Int = 0, healing: Int = 0, stun: Int = 0) {
        self.name = name
        self.cursedEnergy = cursedEnergy
        self.cursedTechnique = cursedTechnique
        self.damage = damage
        self.healing = healing
        self.stun = stun
        self.initialCursedEnergy = cursedEnergy // remains the same as original input. so CursedTechnique can change while this will remain the same.
    }
    
    func replenishCE() { // 380 < 400 ✅
        if (cursedEnergy < initialCursedEnergy) {
            cursedEnergy+=0.1*initialCursedEnergy
            if (cursedEnergy > initialCursedEnergy) { // if overflow, added too much cursed energy (like inital 400, added to 430 from 390)
                cursedEnergy = initialCursedEnergy // set 430 back to 400
            }
        }
        // all other condition is that 400 = 400 - cursed energy level is fine
    }
    func reverseCurseTechnique() -> String { // ✅
        //random value between 50% of all current cursed energy to 5% of all current cursed energy - 1HP translates to around 1.2 cursed energy - How to heal allies using excess?
        let usedCE = Double.random(in: (0.2 * cursedEnergy)...(0.5 * cursedEnergy))
        cursedEnergy -= usedCE
        let healAmount: Int = Int(usedCE/1.2)
        let maxHealth = maxHealth() // remove that amount of cursed energy
        // (100 - 50) = 50 > 30
        
        // 70 + 50 = 120
        healing += healAmount
        let report = "RCT: \(healAmount) HP"
        
        if (health > maxHealth) {
            let excess = health - maxHealth // excess
            cursedEnergy += Double(excess) * 1.2
            healing = healing-excess // remove excess
        }

        return report
        
    }
    
    func techniques() -> (damage: Int, stun: Int, report: String){
        var technique = (0, 0, "")
        
        // cursedTechnique: ["Reversal Red": [20.0, 0.0], "Lapse Blue": [5.0, 3.0], "Hollow Purple": [45.5, 2.0]]
        if (grade < 3 && Int.random(in: 0...1000000) == 271) { // BLACK FLASH
            technique = (71, 4, "ϐׁׅ֒ᥣׁׅ֪ɑׁׅ֮ᝯׁƙׁׅ֑ ⨍ᥣׁׅ֪ɑׁׅ֮꯱ׁׅ֒hׁׅ֮!!!")
        } else {
            let attacks = Array(cursedTechnique.keys)

            let attack = attacks.randomElement()

            if let attack = attack {
                let attackStats = cursedTechnique[attack]

                if let attackStats = attackStats {
                    let energyCost = attackStats[2]

                    if energyCost < cursedEnergy {
                        technique = (Int(attackStats[0]), Int(attackStats[1]), attack)
                    } else {
                        technique = techniques() // if we roll an ult, and don't have enough.
                    }
                }
            }
        }
        return technique
    }
         
    
    // all ults require at least 55% of all cursed technique - domain expansion 75%
    func action() -> (damage: Int, stun: Int, report: String) {
        var actions = (damage: 0, stun: 0, report: "")
        let choice = Int.random(in: 1...2)
        
        if (choice == 1) {
            actions = techniques()
            // actions = (10, 0, "Attack") // add atack function.
        }
        else if (choice == 2) { //Heal - random value between 75% of all current cursed energy to 5% of all current cursed energy - 1HP translates to around 1.2 cursed energy
            let maxHealth = maxHealth()
            if (grade < 2 && Int(cursedEnergy) != 0 && Int(initialCursedEnergy) != 0 && maxHealth != health) { // must be grade 1 or up, must have more than 0 cursedEnergy, cannot have heavenly restriction, if health is 100%, won't get heal
            
                let report = reverseCurseTechnique()
                actions = (0, 0, report)
            } else {
                actions = action() // if cannot use RTC, reroll.
            }
        }
        return actions
    }
    
    
    func maxHealth() -> Int { // ✅
        return 125 - grade * 25
    }
        
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
    
    // return cursedEnergypercentage
    func cursedEnergyPercentage() -> String { //✅
        if (initialCursedEnergy == 0) {
            return "Heavenly Restriction - No Cursed Energy"
        }else {
            return "Cursed Energy Lvl: \(Int(100*(cursedEnergy/initialCursedEnergy)))%"
        }
    }
    
    func ranking() -> String { //✅
        var rank: String = ""
        if (grade == 0) {
            rank.append("Special Grade")
        } else {
            rank.append("Grade \(grade)")
        }
        return rank
    }
}

class Team {
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
    
    func turn() -> (damage: Int, stun: Int, report: String) { // ✅
        // output a certain damage, stun, and report: (heal, attack: "ability")
        let randomPlayer = activePlayers.randomElement()!
        let result = randomPlayer.action()
        recover()
        
        return (damage: result.damage, stun: result.stun, report: "\(randomPlayer.name) - \(result.report)")
    }
    
    func receive(damage: Int, stun: Int, report: String) -> Bool { // ✅
        // check if win or lost, take the damge
        if (activePlayers.isEmpty) {
            teamReport()
            return true
        } else {
            let randomPlayer = activePlayers.randomElement()! // pick random player
            
            if (randomPlayer.heavenlyRestriction == true && report == "Satoru Gojo - Hollow Purple") { // heavenlyRestriction - hollow purple guaranteed one shot.
                randomPlayer.damage = 100000
                randomPlayer.stun = -1
            }
            
            else {
                randomPlayer.damage = damage
                randomPlayer.stun = stun
            }
            teamReport() // report stats
            
            recover()
            return false
        }
    }
    
    func recover() { // ✅
        for player in players {
            player.replenishCE() // recover cursedEnergy after
            if (player.stun > 0) {
                player.stun -= 1
            }
            
        }
    }

    func teamReport() { //
        // return reports regarding a entire team on a certain round
        var names = [String]()
        for player in players { // add to list
            names.append("\(player.name): \(player.ranking()) Sorcerer\nStatus: \(player.statusReport())\n\(player.cursedEnergyPercentage()) \n")
        }
        print("************************************************************")
        print("\(name) Roster Report \n\n\(names.joined(separator: "\n"))") // change this for better visuals
        print("************************************************************")
        
       
    }
}

// add one passive ability to all characters that requires no cursed energy
let gojoSatoru = Player(name: "Satoru Gojo", cursedEnergy: 400.00, cursedTechnique: ["Reversal Red": [20, 0, 0], "Lapse Blue": [12, 3, 0], "Hollow Purple": [45, 4, 70]])

let sukunaRyomen = Player(name: "Ryomen Sukuna", cursedEnergy: 395.50, cursedTechnique: ["Dismantle": [24, 0, 0], "Cleave": [15, 2, 0], "Divine Flame": [35, 6, 70]])

let itadoriYuji = Player(name: "Yuji Itadori", cursedEnergy: 335.00, cursedTechnique: ["Divergent Fist": [20, 0, 0], "Piercing Blood": [10, 1, 0], "Dismantle": [24, 2, 70]])


let fushiguroToji = Player(name: "Tojo Fushiguro", cursedEnergy: 0.0, cursedTechnique: ["splitSoulKatana": [22, 0, 0], "invertedSpearofHeaven": [20, 3, 0], "Pistol": [38, 0, 0]])

let team1 = Team(name: "The Super Seniors", players: [gojoSatoru, sukunaRyomen])
let team2 = Team(name: "Tokyo Jujutsu High", players: [itadoriYuji, fushiguroToji])



let firstTurn = team1.turn()
print(firstTurn.report)

team2.receive(damage: firstTurn.damage, stun: firstTurn.stun, report: firstTurn.report)
print(firstTurn.damage)
print(team2.players[1].health)
print("hi")
