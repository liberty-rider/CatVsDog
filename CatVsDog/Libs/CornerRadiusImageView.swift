import UIKit

@IBDesignable public class CornerRadiusImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            designCorners()
        }
    }
    
    @IBInspectable var topLeft: Bool = false {
        didSet {
            designCorners()
        }
    }
    
    @IBInspectable var topRight: Bool = false {
        didSet {
            designCorners()
        }
    }
    
    @IBInspectable var bottomLeft: Bool = false {
        didSet {
            designCorners()
        }
    }
    
    @IBInspectable var bottomRight: Bool = false {
        didSet {
            designCorners()
        }
    }
    
    func designCorners() {
        var rawValue: UInt = 0
        if topLeft { rawValue += UIRectCorner.topLeft.rawValue }
        if topRight { rawValue += UIRectCorner.topRight.rawValue }
        if bottomLeft { rawValue += UIRectCorner.bottomLeft.rawValue }
        if bottomRight { rawValue += UIRectCorner.bottomRight.rawValue }
        let shape = CAShapeLayer()
        shape.bounds = self.frame
        shape.position = self.center
        shape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: UIRectCorner(rawValue: rawValue), cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        self.layer.mask = shape
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.designCorners()
        clipsToBounds = true
    }
}
