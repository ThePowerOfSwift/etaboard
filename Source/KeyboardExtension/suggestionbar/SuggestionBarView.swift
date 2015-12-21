import UIKit

class SuggestionBarView: UIView {
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    
    let suggestionButton = SuggestionBarView.createButton(Colors.highlight)
    let verbatimButton = SuggestionBarView.createButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(suggestionButton)
        
        verbatimButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        addSubview(verbatimButton)
        
        align([.Top, .Height, .CenterX], of: suggestionButton)
        align([.Top, .Height, .Left], of: verbatimButton)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private static func createButton(titleColor: UIColor = Colors.light) -> UIButton {
        let button = UIButton()
        button.setTitleColor(titleColor, forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
