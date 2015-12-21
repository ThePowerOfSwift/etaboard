import UIKit

class SuggestionBarView: UIView {
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    let suggestionButton = UIButton(type: .Custom)
    let verbatimButton = UIButton(type: .Custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        suggestionButton.setTitleColor(Colors.highlight, forState: .Normal)
        suggestionButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(suggestionButton)
        align([.Top, .Height, .CenterX], of: suggestionButton)

        verbatimButton.setTitleColor(Colors.light, forState: .Normal)
        verbatimButton.translatesAutoresizingMaskIntoConstraints = false
        verbatimButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        addSubview(verbatimButton)
        align([.Top, .Height, .Left], of: verbatimButton)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func displayVerbatim(verbatim: String?) {
        verbatimButton.setTitle(verbatim, forState: .Normal)
    }
    func onVerbatim(target target: AnyObject, action: Selector) {
        verbatimButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
    
    func displaySuggestion(suggestion: String?) {
        suggestionButton.setTitle(suggestion, forState: .Normal)
    }
    func getCurrentSuggestion() -> String? {
        return suggestionButton.titleForState(.Normal)
    }
    func onSuggestion(target target: AnyObject, action: Selector) {
        suggestionButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
}
