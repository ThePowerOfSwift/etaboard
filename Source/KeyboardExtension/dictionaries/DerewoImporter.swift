import Foundation


let relativePathToDerewo = Process.arguments[1]
NSLog("relative path to Derewo: \(relativePathToDerewo)")
let maxFrequencyClass = Int(Process.arguments[2])!
NSLog("max frequency class: \(maxFrequencyClass)")

let url = NSURL(fileURLWithPath: relativePathToDerewo)
let absolutePathToDerewo = url.path!

do {
    let dictionaryAsString = try String(contentsOfFile: absolutePathToDerewo, encoding: NSISOLatin1StringEncoding)
    let lines = dictionaryAsString.split("\n")
    createDerewoExcerpt(lines, maxFrequencyClass: maxFrequencyClass)
        .forEach { print($0) }
} catch _ as NSError {
    NSLog("could not load dictionary from path \(absolutePathToDerewo)")
}
