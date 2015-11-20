import CoreGraphics


struct ConcreteLayout {
    let offset = CGFloat(5)
    var keysWithCoordinates = [String: (CGFloat, CGFloat)]()
    let hypotenuseLength: Double

    init(schematicLayout: [String], size: CGSize) {
        let rows = schematicLayout
        let effectiveHeight = size.height - offset * 2
        let effectiveWidth = size.width - offset * 2
        let keyHeight = effectiveHeight / CGFloat(rows.count)
        for (rowIdx, row) in rows.enumerate() {
            let y = keyHeight * (CGFloat(rowIdx) + 0.5) + offset
            
            let keysInRow = row.split(" ")
            let keyWidth = effectiveWidth / CGFloat(keysInRow.count)
            for (posInRow, key) in keysInRow.enumerate() {
                let x = keyWidth * (CGFloat(posInRow) + 0.5) + offset
                keysWithCoordinates[key] = (x, y)
            }
        }
        
        hypotenuseLength = Double(sqrt(size.width*size.width + size.height*size.height))
    }
    
    init(basedOn: ConcreteLayout, transformer: (String) -> String) {
        for (key, keyCoordinates) in basedOn.keysWithCoordinates {
            keysWithCoordinates[transformer(key)] = keyCoordinates
        }
        hypotenuseLength = basedOn.hypotenuseLength
    }

    func closestKey(to tap: CGPoint) -> String {
        var keyForDistance = [CGFloat: String]()

        for (key, keyCenter) in keysWithCoordinates {
            keyForDistance[distanceBetween(keyCenter, and: tap)] = key
        }
        return keyForDistance[keyForDistance.keys.minElement()!]!
    }
    
    func normalizedDistanceBetween(keyA: String, and keyB: String) -> Double {
        if keyA == keyB { return 0 }
        guard let pointA = keysWithCoordinates[keyA] else { return 1 }
        guard let pointB = keysWithCoordinates[keyB] else { return 1 }
        let pointBAsCGPoint = CGPointMake(pointB.0, pointB.1)
        return Double(distanceBetween(pointA, and: pointBAsCGPoint)) / hypotenuseLength
    }

    private func distanceBetween(pointA: (CGFloat, CGFloat), and pointB: CGPoint) -> CGFloat {
        let dx = pointA.0 - pointB.x
        let dy = pointA.1 - pointB.y
        return sqrt(dx*dx + dy*dy)
    }
}
