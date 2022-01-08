//
//  TimelinePoint.swift
//  MobileCredential
//
//  Created by leeyeon2 on 2022/01/08.
//

import Foundation
import UIKit
import GLKit
import AVFoundation

public struct TimelinePoint {
    public var diameter: CGFloat = 6.0 {
        didSet {
            if (diameter < 0.0) {
                diameter = 0.0
            } else if (diameter > 100.0) {
                diameter = 100.0
            }
        }
    }
    
    public var lineWidth: CGFloat = 2.0 {
        didSet {
            if (lineWidth < 0.0) {
                lineWidth = 0.0
            } else if(lineWidth > 20.0) {
                lineWidth = 20.0
            }
        }
    }
    public var type = 0;
    
    public var color = UIColor.black
    
    public var isFilled = false
    
    internal var position = CGPoint(x: 0, y: 0)

    
    public init(diameter: CGFloat, lineWidth: CGFloat, color: UIColor, filled: Bool) {
        self.diameter = diameter
        self.lineWidth = lineWidth
        self.color = color
        self.isFilled = filled
    }
    
    public init(diameter: CGFloat, color: UIColor, filled: Bool) {
        self.init(diameter: diameter, lineWidth: 2.0, color: color, filled: filled)
    }
    
    var shapeLayer = CALayer()
    var myImage = UIImage().cgImage
//    public init(type: Int) {
//        myImage = nil
//
//        if type == 0{ //출근
//            shapeLayer = CALayer()
//            myImage = UIImage(named: "Attendance-checked-green")?.cgImage
//        }
//        else if type == 1{
//            shapeLayer = CALayer()
//            myImage = UIImage(named: "Attendance-checked-red")?.cgImage
//        }
//        else if type == 2{
//            shapeLayer = CALayer()
//            myImage = UIImage(named: "meeting")?.cgImage
//        }
//        else if type == 3{
//
//        }
//    }
    
    
    
    public init(color: UIColor, filled: Bool) {
        self.init(diameter: 6.0, lineWidth: 2.0, color: color, filled: filled)
    }
    
    public init() {
        self.init(diameter: 6.0, lineWidth: 2.0, color: UIColor.black, filled: false)
    }
    
    //
    public init(type: Int) {
        //현재시각 전
        if type == 0{ //현재시간
            self.init(diameter: 6.0, lineWidth: 2.0, color: #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1),  filled: true)
        //현재시간
        }else if type == 1{
            self.init(diameter: 10.0, lineWidth: 2.0, color: #colorLiteral(red: 0.9195110798, green: 0.3310310245, blue: 0.09859902412, alpha: 1),  filled: false)
        //현재시간 이후
        }else{
            self.init(diameter: 6.0, lineWidth: 2.0, color: #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1),  filled: true)
        }
    }
    
    public func draw(view: UIView) {
        let path = UIBezierPath(ovalIn: CGRect(x: position.x - diameter / 2, y: position.y - diameter / 2, width: diameter, height: diameter))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.fillColor = isFilled ? color.cgColor : UIColor.white.cgColor
        shapeLayer.lineWidth = lineWidth

        view.layer.addSublayer(shapeLayer)
    }
    
    
    public func draw2(view: UIView) {
        shapeLayer.frame = CGRect(x: position.x-13 , y: position.y-12, width: 25, height:25)
        shapeLayer.contents = myImage
        shapeLayer.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        view.layer.addSublayer(shapeLayer)
    }
}


fileprivate func polygonPointArray(sides: Int, x: CGFloat, y: CGFloat, radius: CGFloat) -> [CGPoint] {
    let angle = 2 * CGFloat.pi / CGFloat(sides)
    var i = 0
    var points = [CGPoint]()
    while i <= sides {
        let xpo = x + radius * sin(angle * CGFloat(i))
        let ypo = y + radius * cos(angle * CGFloat(i))
        points.append(CGPoint(x: xpo, y: ypo))
        i += 1
    }
    return points
}

extension UIBezierPath {

    convenience init(hexagonOfSize width: CGFloat) {
        self.init()
        let points = polygonPointArray(sides: 6, x: width / 2, y: width / 2, radius: width / 2.0)
        move(to: points[0])
        for point in points[1...] {
            addLine(to: point)
        }
        close()
    }

    convenience init(diamondOfSize width: CGFloat) {
        self.init()
        let points = polygonPointArray(sides: 4, x: width / 2, y: width / 2, radius: width / 2.0)
        move(to: points[0])
        for point in points[1...] {
            addLine(to: point)
        }
        close()
    }

    convenience init(diamondSlashOfSize width: CGFloat) {
        self.init(diamondOfSize: width)
        move(to: CGPoint(x: 0, y: width/2))
        addLine(to: CGPoint(x: width, y: width / 2))
    }

    convenience init(ovalOfSize width: CGFloat) {
        self.init(ovalIn: CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: width)))
    }

    convenience init(carrotOfSize width: CGFloat) {
        self.init()
        move(to: CGPoint(x: width/2, y: 0))
        addLine(to: CGPoint(x: width, y: width / 2))
        addLine(to: CGPoint(x: width / 2, y: width))
    }

    convenience init(arrowOfSize width: CGFloat) {
        self.init(carrotOfSize: width)
        move(to: CGPoint(x: 0, y: width/2))
        addLine(to: CGPoint(x: width, y: width / 2))
    }
}
