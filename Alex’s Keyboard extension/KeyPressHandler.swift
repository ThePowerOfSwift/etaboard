
class KeyPressHandler {
    let input: UIKeyInput
    
    init(input: UIKeyInput) {
        self.input = input
    }
    
    func handle(key: String) {
        if key == KeyboardModel.Enter {
            input.insertText("\n")
        }
        else if key == KeyboardModel.Backspace {
            input.deleteBackward()
        }
        else if key == KeyboardModel.Space {
            input.insertText(" ")
        }
        else {
            input.insertText(key)
        }

    }
}