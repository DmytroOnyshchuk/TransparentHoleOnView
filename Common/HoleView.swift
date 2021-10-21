//
//  HoleView.swift
//  HoleView
//
//  Created by Dmitry Onishchuk on 21.10.2021.
//

import UIKit

@IBDesignable
class HoleView: UIView {
    
    @IBInspectable
    var radius: CGFloat = 10 { didSet { updateMask() } }
    
    @IBInspectable
    var XPositionPercent: CGFloat = 50 { didSet { updateMask() } }
    
    @IBInspectable
    var YPositionPercent: CGFloat = 50 { didSet { updateMask() } }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateMask()
    }
    
    private func updateMask() {
        
        let XPos = (bounds.width * XPositionPercent) / 100
        let YPos = (bounds.height * YPositionPercent) / 100
        
        let center = CGPoint(x: XPos, y: YPos)
        
        let path = UIBezierPath(rect: bounds)
        path.addArc(withCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        let mask = CAShapeLayer()
        mask.fillRule = .evenOdd
        mask.path = path.cgPath
        
        layer.mask = mask
    }
}
