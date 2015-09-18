
class SuggestionBarView: UIView {
    let suggester = Suggester()
    
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    let buttonForSuggestion = UIButton(type: .Custom)
    
    convenience init(target: AnyObject, action: Selector) {
        self.init()
        
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.translatesAutoresizingMaskIntoConstraints = false
        buttonForSuggestion.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        addSubview(buttonForSuggestion)
        align([.Top, .Height, .CenterX], of: buttonForSuggestion)
        
        displaySuggestion("Claudi")
    }
    
    private func displaySuggestion(suggestion: String) {
        buttonForSuggestion.setTitle(suggestion, forState: .Normal)
    }
}

extension SuggestionBarView: DocumentDelegate {
    func didChangeCurrentWord(newCurrentWord: String?) {
        let suggestion = suggester.suggestCompletion(to: newCurrentWord)
        displaySuggestion(suggestion)
    }
}