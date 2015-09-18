
class SuggestionBarView: UIView {
    
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    let buttonForSuggestion = UIButton(type: .Custom)
    
    convenience init(target: AnyObject, action: Selector) {
        self.init()
        
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.setTitle("Claudi", forState: .Normal)
        buttonForSuggestion.translatesAutoresizingMaskIntoConstraints = false
        buttonForSuggestion.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        addSubview(buttonForSuggestion)
        
        align([.Top, .Height, .CenterX], of: buttonForSuggestion)
    }
}

extension SuggestionBarView: DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?) {
        buttonForSuggestion.setTitle(newCurrentWord, forState: .Normal)
    }
}