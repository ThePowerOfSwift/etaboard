
class SuggestionBarView: UIView {
    
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    
    func initStuff(target: AnyObject, action: Selector) {
        var buttonForSuggestion = UIButton.buttonWithType(.Custom) as! UIButton
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.setTitle("Claudi", forState: .Normal)
        buttonForSuggestion.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonForSuggestion.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        addSubview(buttonForSuggestion)
        
        self.addConstraints([
            align(.Top, of: buttonForSuggestion, and: self),
            align(.Height, of: buttonForSuggestion, and: self),
            align(.CenterX, of: buttonForSuggestion, and: self),
            ])
    }
    
    func align(attribute: NSLayoutAttribute, of item1: AnyObject, and item2: AnyObject) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item1, attribute: attribute,
            relatedBy: .Equal, toItem: item2, attribute: attribute, multiplier: 1, constant: 0)
    }
    
    static func create(target: AnyObject, action: Selector) -> UIView {
        var suggestionBar = SuggestionBarView()
        suggestionBar.initStuff(target, action: action)
        return suggestionBar
    }
}