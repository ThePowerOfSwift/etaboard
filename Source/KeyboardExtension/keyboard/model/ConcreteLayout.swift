struct ConcreteLayout {
    var keysWithCoordinates = [String: (CGFloat, CGFloat)]()

    init(schematicLayout: [String], size: CGSize) {
        let rows = schematicLayout
        let noOfRowSegments = CGFloat(rows.count * 2)
        for (rowIdx, row) in rows.enumerate() {
            let y = size.height / noOfRowSegments * (CGFloat(rowIdx) * 2 + 1)
            
            let keysInRow = row.split(" ")
            let numberOfKeySegments = CGFloat(keysInRow.count * 2)
            for (posInRow, key) in keysInRow.enumerate() {
                let x = size.width / numberOfKeySegments * (CGFloat(posInRow) * 2 + 1)
                keysWithCoordinates[key] = (x, y)
            }
        }
    }
    
    init(basedOn: ConcreteLayout, transformer: (String) -> String) {
        for (key, keyCoordinates) in basedOn.keysWithCoordinates {
            keysWithCoordinates[transformer(key)] = keyCoordinates
        }
    }

    func closestKey(to tap: CGPoint) -> String {
        var keyForDistance = [CGFloat: String]()

        for (key, keyCenter) in keysWithCoordinates {
            keyForDistance[distanceBetween(keyCenter, and: tap)] = key
        }
        return keyForDistance[keyForDistance.keys.minElement()!]!
    }

    private func distanceBetween(pointA: (CGFloat, CGFloat), and pointB: CGPoint) -> CGFloat {
        let dx = pointA.0 - pointB.x
        let dy = pointA.1 - pointB.y
        return sqrt(dx*dx + dy*dy)
    }
}