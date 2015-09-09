
class SuggestionBarView: UIView {
    
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    
    func initStuff(target: AnyObject, action: Selector) {
        var buttonForSuggestion = UIButton.buttonWithType(.Custom) as! UIButton
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.setTitle("Claudi", forState: .Normal)
        buttonForSuggestion.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonForSuggestion.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        addSubview(buttonForSuggestion)
        
        align([.Top, .Height, .CenterX], of: buttonForSuggestion)
    }
    
    static func create(target: AnyObject, action: Selector) -> UIView {
        var suggestionBar = SuggestionBarView()
        suggestionBar.initStuff(target, action: action)
        return suggestionBar
    }
}