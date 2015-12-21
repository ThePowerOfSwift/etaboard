
extension UIColor {
    class func colorFromHex(hexString: String) -> UIColor {
        var rgbValue: UInt32 = 0
        let scanner =  NSScanner(string: hexString)
        
        scanner.scanLocation = 1
        scanner.scanHexInt(&rgbValue)
        
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue:  CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
    }
}
