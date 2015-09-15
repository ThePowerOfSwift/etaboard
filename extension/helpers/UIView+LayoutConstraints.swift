extension UIView {
    func align(attribute: NSLayoutAttribute, of item1: AnyObject, to item2: AnyObject) {
        align([attribute], of: item1, with: item2)
    }

    func align(attributes: [NSLayoutAttribute], of item1: AnyObject, with item2: AnyObject) {
        addConstraints(attributes.map(createAlignConstraint(of: item1, and: item2)))
    }

    func align(attributes: [NSLayoutAttribute], of item1: AnyObject) {
        align(attributes, of: item1, with: self)
    }
    
    func align(attributeOfItem1: NSLayoutAttribute, of item1: AnyObject,
        with attributeOfItem2: NSLayoutAttribute, of item2: AnyObject) {
        addConstraint(NSLayoutConstraint(item: item1, attribute: attributeOfItem1,
            relatedBy: .Equal, toItem: item2, attribute: attributeOfItem2, multiplier: 1, constant: 0))
    }

    private func createAlignConstraint(of item1: AnyObject, and item2: AnyObject) -> NSLayoutAttribute -> NSLayoutConstraint {
        return {
            (attribute: NSLayoutAttribute) -> NSLayoutConstraint in
            NSLayoutConstraint(item: item1, attribute: attribute,
            relatedBy: .Equal, toItem: item2, attribute: attribute, multiplier: 1, constant: 0)
        }
    }
}