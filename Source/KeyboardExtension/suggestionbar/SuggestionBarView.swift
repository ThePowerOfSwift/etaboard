import UIKit

class SuggestionBarView: UIStackView {
    override class func requiresConstraintBasedLayout() -> Bool { return true }
    
    private let verbatimButton = SuggestionBarView.createButton()
    
    private var suggestionButtons = [
        SuggestionBarView.createButton(Colors.highlight),
        SuggestionBarView.createButton()
    ]
    
    init() {
        super.init(arrangedSubviews: [])
        
        axis = .Horizontal
        distribution = .FillEqually
        alignment = .Fill
        spacing = 5.0

        verbatimButton.contentEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0)
        addArrangedSubview(verbatimButton)

        suggestionButtons.forEach { addArrangedSubview($0) }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private static func createButton(titleColor: UIColor = Colors.light) -> UIButton {
        let button = UIButton()
        button.setTitleColor(titleColor, forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }
    
    func displayVerbatim(verbatim: String?) {
        verbatimButton.setTitle(verbatim, forState: .Normal)
    }
    func onVerbatim(target target: AnyObject, action: Selector) {
        verbatimButton.addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
    

    func displaySuggestions(suggestions: [String]) {
        for (button, suggestion) in zip(suggestionButtons, suggestions) {
            button.setTitle(suggestion, forState: .Normal)
        }
    }
    func mapSuggestions(transform: String -> String) {
        getCurrentSuggestions()
            .map(transform)
            |> displaySuggestions
    }
    private func clearSuggestions() {
        suggestionButtons.forEach { button in
            button.setTitle(nil, forState: .Normal)
        }
    }
    private func getCurrentSuggestions() -> [String] {
        return suggestionButtons.map { $0.titleForState(.Normal) }.flatMap { $0 }
    }
    func onSuggestion(target target: AnyObject, action: Selector) {
        suggestionButtons.forEach { button in
            button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
    }
}
