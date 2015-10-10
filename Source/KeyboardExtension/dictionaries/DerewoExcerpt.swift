import Foundation


func createDerewoExcerpt(lines: [String], maxFrequencyClass: Int) -> [String] {
    func expandShortNotation(line: String) -> String {
        guard let openingParenthesisRange = line.rangeOfString("(") else { return line }
        guard let closingParenthesisRange = line.rangeOfString(")") else { return line }
        
        let prefix = line.substringToIndex(openingParenthesisRange.endIndex.predecessor())
        
        let suffixesStart = openingParenthesisRange.startIndex.successor()
        let suffixesRange = suffixesStart..<closingParenthesisRange.startIndex
        let suffixes = line.substringWithRange(suffixesRange).split(",")
        
        return suffixes.map { prefix + $0 } .joinWithSeparator(",")
    }
    
    func fittingFrequencyClass(lineParts: [String]) -> Bool {
        if lineParts.count == 1 { return true }
        return Int(lineParts[1]) <= maxFrequencyClass
    }
    
    return lines
        .filter { !$0.hasPrefix("#") }
        .map { $0.split(" ") }
        .filter { foo in fittingFrequencyClass(foo) }
        .map { $0[0] }
        .map(expandShortNotation)
        .flatMap { $0.split(",") }
}

func createDerewoExcerpt(lines: [String]) -> [String] {
    return createDerewoExcerpt(lines, maxFrequencyClass: 15)
}
