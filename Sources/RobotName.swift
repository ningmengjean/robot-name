//Solution goes in Sources
import Foundation

class Robot {
    var name: String
    
    init() {
        self.name = Robot.generateName()
    }
    
    func resetName()  {
        self.name = Robot.generateName()
    }

    private static let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}
    private static var usedNames = Set<String>()
    
    private static func generateName() -> String {
        while true {
            let name = randomLetter() + randomLetter() + String(arc4random_uniform(900) + 100)
            if !usedNames.contains(name) {
                usedNames.insert(name)
                return name
            }
        }
    }
    
    private static func randomLetter() -> String {
        let index = Int(arc4random_uniform(UInt32(letters.count)))
        return String(letters[index])
    }
}
