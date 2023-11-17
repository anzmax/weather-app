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
