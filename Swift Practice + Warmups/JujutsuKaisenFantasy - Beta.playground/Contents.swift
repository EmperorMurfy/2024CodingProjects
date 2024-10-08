import Foundation

class Player {
    var status: Int = 0 // -1 = dead, 0 = alive, 0 < x amount of rounds till back in action
    var name: String
    var cursedEnergy: Double // 0 - 500
    var cursedTechnique: [String: Double]
    // [MainAttack, Secondary, Ult, Domain Expansion]
    // Ult - Deal High Damage, Drains cursedEnergy based on Damage Level (Higher, the more it drains)
    // Domain Expansion - Drains set cursedEnergy for all (75~60%), wider radius (meaning can damage more than one person), will set player out of comission for a few rounds

    
    var grade: Int { // can't change
        let ranks = [4, 3, 2, 1, 0] // 0 = Special Grade
        if (cursedEnergy == 0) { // Heavenly Restriction
            return ranks[4]
        }
        else {
            return ranks[Int(Foundation.ceil(cursedEnergy/100.0))] // rounds up, take 384.1 - will turn that into a grade 0
        }
    }
    
    var health: Double { // grade multiplier
        25.0 * Double(grade) // 25 HP for grade 4
    }
    
    var replinishEnergy: Double {
        0.1 * cursedEnergy // replinished 10% of the cursed energy
    }
    
    
    init(name: String = "default", cursedEnergy: Double = 0.0, cursedTechnique: [String : Double] = [:]) {
        self.name = name
        self.cursedEnergy = cursedEnergy
        self.cursedTechnique = cursedTechnique
    }
    /*
    func attack() -> Double {
        let attack = Int.random(in: 1...2)
        
    }
    
   
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
    
    func teamReport() -> String {
        var names = [String]()
        for player in players {
            names.append(player.name)
        }
        
        return """
        \(names.joined(separator: " "))
        """
    }
}
let person1 = Player()
let person2 = Player()
let person3 = Player()
let person4 = Player()


let team = Team(name: "amongus", players: [person1, person2, person3, person4])

print(team.teamReport())
