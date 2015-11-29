
class SuggestionBarView: UIView {
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    let buttonForSuggestion = UIButton(type: .Custom)
    let verbatimButton = UIButton(type: .Custom)
    
    convenience init(target: AnyObject, action: Selector) {
        self.init()
        
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.translatesAutoresizingMaskIntoConstraints = false
        buttonForSuggestion.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        addSubview(buttonForSuggestion)
        align([.Top, .Height, .CenterX], of: buttonForSuggestion)

        verbatimButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        verbatimButton.translatesAutoresizingMaskIntoConstraints = false
        verbatimButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        addSubview(verbatimButton)
        align([.Top, .Height, .Left], of: verbatimButton)
    }
    
    func displayVerbatim(verbatim: String?) {
        verbatimButton.setTitle(verbatim, forState: .Normal)
    }

    func onVerbatim(target target: AnyObject, action: Selector) {
        verbatimButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
    
    func displaySuggestion(suggestion: String?) {
        buttonForSuggestion.setTitle(suggestion, forState: .Normal)
    }
    
    func getCurrentSuggestion() -> String? {
        return buttonForSuggestion.titleForState(.Normal)
    }
}
