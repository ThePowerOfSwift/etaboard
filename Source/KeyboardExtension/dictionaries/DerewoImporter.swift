import Foundation


let pathToDerewo = Process.arguments[1]
NSLog("Path to Derewo: \(pathToDerewo)")
let maxFrequencyClass = Int(Process.arguments[2])!
NSLog("max frequency class: \(maxFrequencyClass)")


do {
    let dictionaryAsString = try String(contentsOfFile: pathToDerewo, encoding: NSISOLatin1StringEncoding)
    let lines = dictionaryAsString.split("\n")
    createDerewoExcerpt(lines, maxFrequencyClass: maxFrequencyClass)
        .forEach { print($0) }
} catch _ as NSError {
    NSLog("could not load dictionary from path \(pathToDerewo)")
}
