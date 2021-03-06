
import Foundation

open class RandomUtil {
    
    /**
     Random string with given length
     */
    open static func getString (length : Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(UInt32(letters.length))
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
    /**
     Random string with email format with given length before '@'
     */
    open static func getEmail (length : Int) -> String {
        return "\(RandomUtil.getString(length: length))@test.com"
    }
    
    /**
     Random int number within range
     */
    open static func getNumber(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    /**
     Random double number within range
     */
    open static func getNumber(min: Double = 0, max: Double = 1) -> Double {
        return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
    }
    
    /**
     Random true or false
     */
    open static func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
}

public extension Set {
    /**
     Random object of set
     */
    public func randomObject() -> Element? {
        let n = Int(arc4random_uniform(UInt32(self.count)))
        let index = self.index(self.startIndex, offsetBy: n)
        return self.count > 0 ? self[index] : nil
    }
}
