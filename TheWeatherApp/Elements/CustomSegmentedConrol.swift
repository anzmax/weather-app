import UIKit

class CustomSegmentedControl: UISegmentedControl {
    
    private var backgroundview: UIView?
    
    override init(items: [Any]?) {
        super.init(items: items)
        
        self.backgroundColor = .customPaleOrange
        self.selectedSegmentTintColor = .customBlue
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.selectedSegmentIndex = 0
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Rubik-Regular", size: 16)!,
            .foregroundColor: UIColor.black,
        ]
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Rubik-Regular", size: 16)!,
            .foregroundColor: UIColor.white
        ]
        
        self.setTitleTextAttributes(normalTextAttributes, for: .normal)
        self.setTitleTextAttributes(selectedTextAttributes, for: .selected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

