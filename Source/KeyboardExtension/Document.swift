
protocol DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?)
}

protocol Document {
    func getToken() -> String?

    func insert(text: String)

    func deleteBackward()
    func deleteToken() -> Bool

    func replaceToken(text: String)
}
