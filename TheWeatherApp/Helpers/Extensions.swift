import UIKit

extension UIColor {
    static let customBlue = UIColor(red: 0.12, green: 0.3, blue: 0.77, alpha: 1)
    static let customDarkBlue = UIColor(red: 0.671, green: 0.737, blue: 0.918, alpha: 1)
    static let customOrange = UIColor(red: 0.949, green: 0.431, blue: 0.067, alpha: 1)
    static let customLightBlue = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1)
    static let customGray = UIColor(red: 0.538, green: 0.513, blue: 0.513, alpha: 1)
    static let customBlack = UIColor(red: 0.154, green: 0.152, blue: 0.135, alpha: 1)
    static let customPaleOrange = UIColor(red: 0.996, green: 0.929, blue: 0.914, alpha: 1)
    static let customYellow = UIColor(red: 0.965, green: 0.867, blue: 0.004, alpha: 1)
    static let customGreen = UIColor(red: 0.507, green: 0.792, blue: 0.501, alpha: 1)
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).lowercased() + dropFirst()
    }
    
    static let descriptionText = "Качество воздуха считается\nудовлетворительным и загрязнения \nвоздуха представляются незначительными \nв пределах нормы"
}

extension UIFont {
    enum RubikFonts: String {
        case regular = "Rubik-Regular"
        case medium = "Rubik-Medium"
    }

    static func rubik(_ font: RubikFonts, size: CGFloat) -> UIFont {
        return UIFont(name: font.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

