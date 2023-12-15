import UIKit

class RegularLabel: UILabel {
    
    init(text: String, color: UIColor, size: CGFloat) {
        super.init(frame: .zero)
        commonInit(text, color: color, size: size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(_ text: String, color: UIColor, size: CGFloat) {
        let font = UIFont.rubik(.regular, size: size)
        let attributedString = NSMutableAttributedString(string: text, attributes: [
            .font: font,
            .foregroundColor: color,
            .kern: 0.14
        ])
        self.numberOfLines = 0
        //self.textAlignment = .center
        self.attributedText = attributedString
    }
}

class MediumLabel: UILabel {
    
    init(text: String, color: UIColor, size: CGFloat) {
        super.init(frame: .zero)
        commonInit(text, color: color, size: size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(_ text: String, color: UIColor, size: CGFloat) {
        let font = UIFont.rubik(.medium, size: size)
        let attributedString = NSMutableAttributedString(string: text, attributes: [
            .font: font,
            .foregroundColor: color,
            .kern: 0.14
        ])
        self.numberOfLines = 0
        self.attributedText = attributedString
    }
}
