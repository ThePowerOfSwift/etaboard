
class SuggestionBarView: UIView {
    
    func initStuff(target: AnyObject, action: Selector) {
        var buttonForSuggestion = UIButton.buttonWithType(.Custom) as! UIButton
        buttonForSuggestion.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        buttonForSuggestion.setTitle("Claudi", forState: .Normal)
        buttonForSuggestion.setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonForSuggestion.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        addSubview(buttonForSuggestion)
        
        var top = NSLayoutConstraint(item: buttonForSuggestion, attribute: .Top,
            relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0)
        var bottom = NSLayoutConstraint(item: buttonForSuggestion, attribute: .Height,
            relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 1, constant: 0)
        var center = NSLayoutConstraint(item: buttonForSuggestion, attribute: .CenterX,
            relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        self.addConstraints([top, bottom, center])
    }
    
    static func create(target: AnyObject, action: Selector) -> UIView {
        var suggestionBar = SuggestionBarView()
        suggestionBar.initStuff(target, action: action)
        return suggestionBar
    }
}