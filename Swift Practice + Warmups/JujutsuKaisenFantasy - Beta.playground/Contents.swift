// Project: Fantasy Team Manager Project - Beta JujutusuKaisenFantasy
// Written by: Mason Z.
// Date: Oct 8, 2024
// Description: Beta Test to get Ideas and Concepts Done.

// no domains for now.


import Foundation

class Player {
    var name: String
    var initialCursedEnergy: Double // 0 - 400
    var cursedEnergy: Double
    var cursedTechnique: [String: [Double]]
    
    var damage: Int
    var healing: Int
    var stun: Int
    
    var status: Int { //var status: Int = 0 // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action
        if (health < 0) {
            return -1
        } else {
            return stun
        }
    }

    // [MainAttack, Secondary, Ult, Domain Expansion]
    // Ult - Deal High Damage, Drains cursedEnergy based on Damage Level (Higher, the more it drains)
    // Domain Expansion - Drains set cursedEnergy for all (75~60%), wider radius (meaning can damage more than one person), will set player out of comission for a few rounds

    var grade: Int { // can't change
        let ranks = [4, 3, 2, 1, 0] // 0 = Special Grade
        if (initialCursedEnergy == 0) { // Heavenly Restriction
            return ranks[4]
        }
        else {
            return ranks[Int(round(initialCursedEnergy/100.0))] // rounds up, take 384.1 - will turn that into a grade 0
        }
    }
    
    var health: Int {
        return ((125 - grade * 25) + healing) - damage
    }
    
    init(name: String = "default", cursedEnergy: Double = 10.0, cursedTechnique: [String : [Double]] = [:], damage: Int = 0, healing: Int = 0, stun: Int = 0) {
        self.name = name
        self.cursedEnergy = cursedEnergy
        self.cursedTechnique = cursedTechnique
        self.damage = damage
        self.healing = healing
        self.stun = stun
        self.initialCursedEnergy = cursedEnergy // remains the same as original input. so CursedTechnique can change while this will remain the same.
    }
    
    func replenishCE() { // 380 < 400
        if (cursedEnergy < initialCursedEnergy) {
            cursedEnergy+=0.1*initialCursedEnergy
            if (cursedEnergy > initialCursedEnergy) { // if overflow, added too much cursed energy (like inital 400, added to 430 from 390)
                cursedEnergy = initialCursedEnergy // set 430 back to 400
            }
        }
        // all other condition is that 400 = 400 - cursed energy level is fine
    }
    func reverseCurseTechnique() { //random value between 50% of all current cursed energy to 5% of all current cursed energy - 1HP translates to around 1.2 cursed energy - How to heal allies using excess?
        let usedCE = Double.random(in: (0.2 * cursedEnergy)...(0.5 * cursedEnergy))
        cursedEnergy -= usedCE
        let healAmount: Int = Int(usedCE/1.2)
        let maxHealth = maxHealth() // remove that amount of cursed energy
        // (100 - 50) = 50 > 30
        
        // 70 + 50 = 120
        healing += healAmount
        print("Reversed Cursed Technique Applied \((healAmount)) to \(name)")
        if (health > maxHealth) {
            let excess = health - maxHealth // excess
            cursedEnergy += Double(excess) * 1.2
            healing = healing-excess // remove excess
        }
    }
    
    
    
    // all ults require at least 55% of all cursed technique - domain expansion 75%
    func action() -> (damage: Int, stun: Int, report: String) {
        var actions = (damage: 0, stun: 0, report: "")
        let choice = Int.random(in: 1...2)
        
        if (choice == 1) {
            actions = (10, 0, "Attack") // add atack function. 
        }
        else if (choice == 2) { //Heal - random value between 75% of all current cursed energy to 5% of all current cursed energy - 1HP translates to around 1.2 cursed energy
            let maxHealth = maxHealth()
            if (grade < 2 && Int(cursedEnergy) != 0 && Int(initialCursedEnergy) != 0 && maxHealth != health) { // must be grade 1 or up, must have more than 0 cursedEnergy, cannot have heavenly restriction, if health is 100%, won't get heal
                reverseCurseTechnique()
                actions = (0, 0, "Used RTC, Skipped Attack")
            } else {
                actions = action() // if cannot use RTC, reroll.
            }
        }
        return actions
    }
     
    /*
    
   
    func domainExpansion() -> (Int, String) {
        
    }
     */
    
    func maxHealth() -> Int {
        return 125 - grade * 25
    }
        
    func statusReport() -> String { // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action
        if (status > 0) {
            return "Currently knocked out for \(status) rounds"
        } else if (status == -1){
            return "Terminated"
        } else {
            return "Currently alive with \(health) HP left"
        }
    }
    
    // return cursedEnergypercentage
    func cursedEnergyPercentage() -> String {
        if (initialCursedEnergy == 0) {
            return "Heavenly Restriction - No Cursed Energy"
        }else {
            return "Cursed Energy Lvl: \(Int(100*(cursedEnergy/initialCursedEnergy)))%"
        }
    }
    
    func ranking() -> String {
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
    
    func turn() -> (damage: Int, stun: Int, report: String) { // output a certain damage, stun, and report
        let randomPlayer = activePlayers.randomElement()!
        let result = randomPlayer.action()

        return (damage: result.damage, stun: result.stun, report: "\(randomPlayer.name) - \(result.report)")
    }
    
    func receive(damage: Int, stun: Int) -> Bool { // check if win or lost, take the damge
        
        if (activePlayers.isEmpty) {
            teamReport()
            return true
        } else {
            let randomPlayer = activePlayers.randomElement()! // pick random player
            
            randomPlayer.damage = damage
            randomPlayer.stun = stun
            
            teamReport()
            return false
        }
    }

    func teamReport() { // report entire team
        var names = [String]()
        for player in players { // add to list
            player.replenishCE()
            names.append("\(player.name): \(player.ranking()) Sorcerer\nStatus: \(player.statusReport())\n\(player.cursedEnergyPercentage()) \n")
        }
        print("************************************************************")
        print("\(name) Roster Report \n\n\(names.joined(separator: "\n"))") // change this for better visuals
        print("************************************************************")
        
       
    }
}

let gojoSatoru = Player(name: "Satoru Gojo", cursedEnergy: 400.00, cursedTechnique: ["Reversal Red": [20.0, 0.0], "Lapse Blue": [5.0, 3.0], "Hollow Purple": [45.5, 2.0]])

let sukunaRyomen = Player(name: "Ryomen Sukuna", cursedEnergy: 395.50, cursedTechnique: ["Dismantle": [22.5, 0.0], "Cleave": [15.0, 2.0], "Divine Flame": [35.5, 3.0]])

let itadoriYuji = Player(name: "Yuji Itadori", cursedEnergy: 335.00, cursedTechnique: ["Divergent Fist": [20.0, 0.0], "Dismantle": [12.5, 0.0], "Black Flash!": [30.0, 4.0]])


let fushiguroToji = Player(name: "Tojo Fushiguro", cursedEnergy: 0.0, cursedTechnique: ["splitSoulKatana": [18.0, 0.0], "invertedSpearofHeaven": [20.5, 3.0], "Pistol": [38.2, 2.0]])

let team1 = Team(name: "The Super Seniors", players: [gojoSatoru, sukunaRyomen])
let team2 = Team(name: "Tokyo Jujutsu High", players: [itadoriYuji, fushiguroToji])

team2.teamReport()

let firstTurn = team1.turn()
print(firstTurn)

team2.receive(damage: firstTurn.damage, stun: firstTurn.stun)


/*
team1.teamReport()

team1.players[2].damage = 120
team1.players[0].cursedEnergy = 355

for player in team1.activePlayers {
    print(player.name)
}

team1.teamReport()

// team1.players[0].cursedEnergy = 0.2
 */



