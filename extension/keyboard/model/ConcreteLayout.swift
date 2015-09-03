class ConcreteLayout {
    let keysWithCoordinates: [String: (CGFloat, CGFloat)]

    init(layout: [String: (CGFloat, CGFloat)]) {
        keysWithCoordinates = layout
    }

    func closestKey(to tap: CGPoint) -> String {
        var keyForDistance = [CGFloat: String]()

        for (key, keyCenter) in keysWithCoordinates {
            keyForDistance[distanceBetween(keyCenter, and: tap)] = key
        }
        return keyForDistance[minElement(keyForDistance.keys)]!
    }

    private func distanceBetween(pointA: (CGFloat, CGFloat), and pointB: CGPoint) -> CGFloat {
        let dx = pointA.0 - pointB.x
        let dy = pointA.1 - pointB.y
        return sqrt(dx*dx + dy*dy)
    }
}