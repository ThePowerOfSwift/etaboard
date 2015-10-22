
public extension SequenceType {
    func groupBy<U : Hashable>(@noescape keyFunc: Generator.Element -> U) -> [U:[Generator.Element]] {
        var dict: [U:[Generator.Element]] = [:]
        for el in self {
            let key = keyFunc(el)
            if let _ = dict[key] { dict[key]!.append(el) }
            else { dict[key] = [el] }
        }
        return dict
    }
}
