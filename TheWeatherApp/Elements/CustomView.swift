import UIKit

class CustomView: UIImageView {
    
    init(named imageName: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

