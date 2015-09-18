
class SuggestionBarView: UIView {
    
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    
    convenience init(target: AnyObject, action: Selector) {
        self.init()
        
        let buttonForSuggestion = UIButton(type: .Custom)
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.setTitle("Claudi", forState: .Normal)
        buttonForSuggestion.translatesAutoresizingMaskIntoConstraints = false
        buttonForSuggestion.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        addSubview(buttonForSuggestion)
        
        align([.Top, .Height, .CenterX], of: buttonForSuggestion)
    }
}