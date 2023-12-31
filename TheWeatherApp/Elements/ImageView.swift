import UIKit

class CustomImageView: UIImageView {
    
    init(named imageName: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomView: UIView {

    init(backgroundColor: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
