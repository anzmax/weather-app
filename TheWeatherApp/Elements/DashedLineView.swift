import UIKit

class DashedLineView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.minX, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.midY))
        
        let dashPattern: [CGFloat] = [4, 4]
        let dashLayer = CAShapeLayer()
        dashLayer.strokeColor = UIColor.customDarkBlue.cgColor
        dashLayer.lineWidth = 0.5
        dashLayer.lineDashPattern = dashPattern as [NSNumber]
        dashLayer.path = path.cgPath
        layer.addSublayer(dashLayer)
    }
}
