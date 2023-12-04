import UIKit

class CustomLabel: UILabel {
    
    
    init(text: String) {
        super.init(frame: .zero)
        commonInit(text)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(_ text: String) {
        self.text = text
        self.font = UIFont(name: "Rubik-Regular", size: 16)
        self.textColor = .customGray
    }
    
}

class CustomDescriptionLabel: UILabel {
    
    init(text: String, color: UIColor) {
        super.init(frame: .zero)
        commonInit(text, color: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(_ text: String, color: UIColor) {
        let font = UIFont.rubik(.regular, size: 14)
        let attributedString = NSMutableAttributedString(string: text, attributes: [
            .font: font,
            .foregroundColor: color,
            .kern: 0.14
        ])
        self.attributedText = attributedString
    }
}

class ConditionLabel: UILabel {
    
    init(text: String, color: UIColor = .customBlack) {
        super.init(frame: .zero)
        commonInit(text, color: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(_ text: String, color: UIColor) {
        let font = UIFont.rubik(.regular, size: 18)
        let attributedString = NSMutableAttributedString(string: text, attributes: [
            .font: font,
            .foregroundColor: color,
            .kern: -0.18
        ])
        self.attributedText = attributedString
    }
}
