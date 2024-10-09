// Project: Fantasy Team Manager Project - Beta JujutusuKaisenFantasy
// Written by: Mason Z.
// Date: Oct 8, 2024
// Description: Beta Test to get Ideas and Concepts Done.

// no domains for now.


import Foundation

class Player {
    var status: Int = 0 // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action
    var name: String
    var initialCursedEnergy: Double // 0 - 400
    var cursedEnergy: Double
    var cursedTechnique: [String: [Double]]
    
    var damage: Double
    var healing: Double

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
    
    var health: Double {
        return ((125.0 - (Double(grade) * 25.0)) + healing) - damage
    }
    
    
    var replinishEnergy: Double { // constant value
        0.1 * initialCursedEnergy // replinished 10% of the cursed energy
    }
    
  
    
    init(name: String = "default", cursedEnergy: Double = 10.0, cursedTechnique: [String : [Double]] = [:], damage: Double = 0.0, healing: Double = 0.0) {
        self.name = name
        self.cursedEnergy = cursedEnergy
        self.cursedTechnique = cursedTechnique
        self.damage = damage
        self.healing = healing
        self.initialCursedEnergy = cursedEnergy // remains the same as original input. so CursedTechnique can change while this will remain the same.
    }
    
    
    func reverseCurseTechnique() { //random value between 50% of all current cursed energy to 5% of all current cursed energy - 1HP translates to around 1.2 cursed energy - How to heal allies using excess? 
        let usedCE = Double.random(in: (0.2 * cursedEnergy)...(0.5 * cursedEnergy))
        cursedEnergy -= usedCE
        let healAmount = usedCE/1.2
        let maxHealth: Double = (125.0 - (Double(grade) * 25.0)) // remove that amount of cursed energy
        // (100 - 50) = 50 > 30
        
        // 70 + 50 = 120
        healing += healAmount
        print("Reversed Cursed Technique Applied \((healAmount)) to \(name)")
        if (health > maxHealth) {
            let excess = health - maxHealth // excess
            cursedEnergy += excess * 1.2
            healing = healing-excess // remove excess
        }
        
    }
    
    
    
    // all ults require at least 55% of all cursed technique - domain expansion 75%
    func action() {
        let choice = Int.random(in: 1...3)
        switch choice {
        case 1: //Attack
            print("attack")
            
        case 2: //Heal - random value between 75% of all current cursed energy to 5% of all current cursed energy - 1HP translates to around 1.2 cursed energy
            print("heal")
            reverseCurseTechnique()
        case 3: // Domain Expansion (If Capable)
            print("Domain EXPANSION")
        default:
            action()
        }
        
        
    }
     
    /*
    
   
    func domainExpansion() -> (Int, String) {
        
    }
     */
        
    func statusReport() -> String { // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action
        if (status > 0) {
            return "\(name) is currently knocked out for \(status) rounds."
        } else if (status == -1){
            return "\(name) is terminated."
        } else {
            return "\(name) is currently alive with \(health) HP left."
        }
    }
    
    
}

class Team {
    var name: String
    var players: [Player]
    
    init(name: String, players: [Player]) {
        self.name = name
        self.players = players
    }
    
    func damageInflicted() {
    }
    
    func teamReport() -> String { // report entire team
        var names = [String]()
        for player in players {
            names.append("\(player.statusReport())\n \(player.grade) Cursed Energy Level is at \(player.cursedEnergy). \n")
        }
        
        return "name report \n\(names.joined(separator: "\n"))" // change this for better visuals
    }
}


// damages - no technique exceed 52.5 damage EXCEPT domain expansion, which cannot exceed 72.5 damage [25, 50, 75, 100, 125]
//



// test ignore this
let gojoSatoru = Player(name: "Gojo Satoru", cursedEnergy: 400.00, cursedTechnique: ["Reversal Red": [20.0, 0.0], "Lapse Blue": [5.0, 4.0], "Hollow Purple": [45.5, 2.0]])


                                                                                    
print(" Grade \(gojoSatoru.grade) Sorcerer")
print(" Health \(gojoSatoru.health)")

gojoSatoru.damage = 10
print(" Health \(gojoSatoru.health)")
gojoSatoru.action()
                                                                                    
print(" Health \(gojoSatoru.health)")


