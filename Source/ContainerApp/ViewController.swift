import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        setBorder(on: textView)
        textView.becomeFirstResponder()
    }

    func setBorder(on view: UITextView) {
        view.layer.borderColor = UIColor.darkGrayColor().CGColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 5.0
    }
}