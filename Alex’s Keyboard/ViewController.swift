import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        textView.becomeFirstResponder()
    }
}

