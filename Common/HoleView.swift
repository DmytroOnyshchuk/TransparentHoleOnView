//
//  LeftHoleView.swift
//  ApproveAnimation
//
//  Created by Dmitry Onishchuk on 21.10.2021.
//

import UIKit

@IBDesignable
class HoleView: UIView {
    
    @IBInspectable
    var radius1: CGFloat = 10 { didSet { updateMask() } }
    
    @IBInspectable
    var XPositionPercent1: CGFloat = 90 { didSet { updateMask() } }
    
    @IBInspectable
    var YPositionPercent1: CGFloat = 50 { didSet { updateMask() } }
    
    
    @IBInspectable
    var radius2: CGFloat = 10 { didSet { updateMask() } }
    
    @IBInspectable
    var XPositionPercent2: CGFloat = 10 { didSet { updateMask() } }
    
    @IBInspectable
    var YPositionPercent2: CGFloat = 50 { didSet { updateMask() } }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateMask()
    }
    
    private func updateMask() {
        
        let path = UIBezierPath(rect: bounds)
        path.usesEvenOddFillRule = false
        
        
        // MARK: Hole 1
        let XPos1 = (bounds.width * XPositionPercent1) / 100
        let YPos1 = (bounds.height * YPositionPercent1) / 100
        let center1 = CGPoint(x: XPos1, y: YPos1)
        
        let hole1 = UIBezierPath(arcCenter: center1,
                                 radius: radius1,
                                 startAngle: 0,
                                 endAngle: 2 * .pi,
                                 clockwise: true)
        path.append(hole1)
        
        // MARK: Hole 2
        let XPos2 = (bounds.width * XPositionPercent2) / 100
        let YPos2 = (bounds.height * YPositionPercent2) / 100
        let center2 = CGPoint(x: XPos2, y: YPos2)
        let hole2 = UIBezierPath(arcCenter: center2,
                                 radius: radius2,
                                 startAngle: 0,
                                 endAngle: 2 * .pi,
                                 clockwise: true)
        path.append(hole2)
        
        
        
        let mask1 = CAShapeLayer()
        mask1.fillRule = .evenOdd
        mask1.path = path.cgPath
        
        layer.mask = mask1
    }
}
