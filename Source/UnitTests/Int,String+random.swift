import Foundation

extension Int {
    static func random(max ceiling: Int) -> Int {
        return Int(arc4random_uniform(UInt32(ceiling+1)))
    }
    
    static func random(min floor: Int, max ceiling: Int) -> Int {
        return random(max: ceiling - floor) + floor
    }
}

extension String {
    static let alphaNumAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    static func randomAlphaNumericChar() -> Character {
        let randomIndexInAlphabet = Int.random(max: alphaNumAlphabet.characters.count-1)
        return alphaNumAlphabet[alphaNumAlphabet.startIndex.advancedBy(randomIndexInAlphabet)]
    }
    
    static func random(length length:Int) -> String {
        var result = ""
        for _ in (1...length) {
            result.append(randomAlphaNumericChar())
        }
        return result
    }
    
    static func random() -> String {
        return random(length: Int.random(min: 1, max: 20))
    }
}