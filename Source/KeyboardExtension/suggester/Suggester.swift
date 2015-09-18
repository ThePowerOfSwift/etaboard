class Suggester {
    func suggestCompletion(to currentContext: String?) -> String {
        if let currentWord = currentContext {
            if (currentWord.hasPrefix("m")) { return "Moin" }
        }
        return "😊"
    }
}