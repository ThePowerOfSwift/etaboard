extension String {
    func split(separator: Character) -> [String] {
        return characters.split { $0 == separator }.map { String($0) }
    }

    func first() -> Character {
        return Array(self.characters)[0]
    }
}
