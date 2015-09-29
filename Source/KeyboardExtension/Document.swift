
protocol DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?)
}

protocol Document {
    func currentWord() -> String?
    func replaceCurrentWord(text: String)
    func deleteBackward()
    func insert(text: String)
}