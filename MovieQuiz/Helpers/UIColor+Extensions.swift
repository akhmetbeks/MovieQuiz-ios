import UIKit

extension UIColor {
    private enum Colors {
        static let ypGreen = "YP Green"
        static let ypRed = "YP Red"
        static let ypBlack = "YP Black"
        static let ypBackground = "YP Background"
        static let ypGray = "YP Gray"
        static let ypWhite = "YP White"
    }
    
    static var ypGreen: UIColor { UIColor(named: Colors.ypGreen) ?? UIColor.green }
    static var ypRed: UIColor { UIColor(named: Colors.ypRed) ?? UIColor.red }
    static var ypBlack: UIColor { UIColor(named: Colors.ypBlack) ?? UIColor.black }
    static var ypBackground: UIColor { UIColor(named: Colors.ypBackground) ?? UIColor.darkGray }
    static var ypGray: UIColor { UIColor(named: Colors.ypGray) ?? UIColor.gray }
    static var ypWhite: UIColor { UIColor(named: Colors.ypWhite) ?? UIColor.white }
}
