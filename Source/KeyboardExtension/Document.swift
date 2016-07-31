
protocol DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?)
}

protocol Document {
    func currentWord() -> String?

    func insert(text: String)

    func deleteBackward()
    func deleteCurrentWord() -> Bool

    func replaceCurrentWord(text: String)
}
