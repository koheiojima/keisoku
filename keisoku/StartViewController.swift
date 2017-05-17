//
//  StartViewController.swift
//  keisoku
//
//  Created by 小島光平 on 2017/04/28.
//  Copyright © 2017年 小島光平. All rights reserved.
//

import UIKit
import TrueScale

class StartViewController: UIViewController {
    
    var bars = [UIView]()
    var labels = [UILabel]()
    
    //画面の横幅 (mm換算はできない)
    var windowW: CGFloat!
    //画面の高さ (mm換算はできない)
    var windowH: CGFloat!
    //1mm x 1mmの四角形
    let rect = TSRect(x: 0, y: 0, width: 1, height: 1, unit: .mm).cgrect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        windowW = self.view.bounds.width
        windowH = self.view.bounds.height
        
        //下側に表示する関数を呼ぶ（今回たまたま)
        drawRulerBottom()
    }
    func resetArray() {
        for bar in bars {
            bar.removeFromSuperview()
        }
        bars.removeAll()
        for label in labels {
            label.removeFromSuperview()
        }
        labels.removeAll()
        self.view.setNeedsDisplay()
    }
    //左側に定規を表示する
    func drawRulerLeftSide() {
        //厚み0.2mmのデフォルト目盛り
        let bar = TSRect(x: 0, y: 0, width: 10, height: 0.2, unit: .mm).cgrect
        //目盛りのラベルのデフォルトフレーム
        let labelRect = TSRect(x: 17, y: 0, width: 4, height: 4).cgrect
        //目盛りを表示できる数
        let count: Int = Int(windowH / rect.height) + 1
        
        //一旦前に描画した定規を消す
        resetArray()
        
        for i in (0 ..< count) {
            
            if i % 10 == 0 { //長い目盛りの時
                let longBar = UIView(frame: bar)
                longBar.frame.size.width *= 1.5
                longBar.frame.origin.y = CGFloat(i) * rect.height
                longBar.backgroundColor = UIColor.darkGray
                bars.append(longBar)
                self.view.addSubview(longBar)
                
                let label = UILabel(frame: labelRect)
                label.text = String(Int(i/10))
                //ここを加工して続きからできるようにする
                label.frame.origin.x = CGFloat(i) * rect.width
                label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
                label.frame.origin.y -= 5
                
                labels.append(label)
                self.view.addSubview(label)
                
            } else {//短い目盛りの時
                let shortBar = UIView(frame: bar)
                shortBar.frame.origin.y = CGFloat(i) * rect.height
                shortBar.backgroundColor = UIColor.darkGray
                bars.append(shortBar)
                self.view.addSubview(shortBar)
            }
        }
        self.view.setNeedsDisplay()
    }
    
    //下部に定規を表示する
    func drawRulerBottom() {
        let bar = TSRect(x: 0, y: 0, width: 0.2, height: 10, unit: .mm).cgrect
        let labelRect = TSRect(x: 0, y: 17, width: 4, height: 4).cgrect
        let count: Int = Int(windowW / rect.width) + 1
        
        resetArray()
        
        for i in (0 ..< count) {
            if i % 10 == 0 { //長い目盛りの時
                let longBar = UIView(frame: bar)
                longBar.frame.size.height *= 1.5
                longBar.frame.origin.x = CGFloat(i) * rect.width
                longBar.frame.origin.y = windowH - longBar.frame.size.height
                longBar.backgroundColor = UIColor.darkGray
                bars.append(longBar)
                self.view.addSubview(longBar)
                
                let label = UILabel(frame: labelRect)
                label.text = String(Int(i/10))
                //ここを加工して続きからできるようにする
                label.frame.origin.x = CGFloat(i) * rect.width
                label.frame.origin.y = windowH - longBar.frame.size.height
                label.frame.origin.x += 5
                labels.append(label)
                self.view.addSubview(label)
                
            } else {
                //短い目盛りの時
                let shortBar = UIView(frame: bar)
                shortBar.frame.origin.x = CGFloat(i) * rect.width
                shortBar.frame.origin.y = windowH - shortBar.frame.size.height
                shortBar.backgroundColor = UIColor.darkGray
                bars.append(shortBar)
                self.view.addSubview(shortBar)
            }
        }
        self.view.setNeedsDisplay()
    }
    
    //右側に定規を表示する
    func drawRulerRightSide() {
        let bar = TSRect(x: 0, y: 0, width: 10, height: 0.2, unit: .mm).cgrect
        let labelRect = TSRect(x: 17, y: 0, width: 4, height: 4).cgrect
        let count: Int = Int(windowH / rect.height) + 1
        
        resetArray()
        
        for i in (0 ..< count) {
            if i % 10 == 0 { //長い目盛りの時
                let longBar = UIView(frame: bar)
                longBar.frame.size.width *= 1.5
                longBar.frame.origin.y = windowH - (CGFloat(i) * rect.height)
                longBar.frame.origin.x = windowW - longBar.frame.size.width
                longBar.backgroundColor = UIColor.darkGray
                bars.append(longBar)
                self.view.addSubview(longBar)
                
                let label = UILabel(frame: labelRect)
                label.text = String(Int(i/10)) //ここを加工して続きからできるようにする
                label.frame.origin.y = windowH - (CGFloat(i) * rect.height)
                label.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi / 2))
                label.frame.origin.y -= 5
                
                labels.append(label)
                self.view.addSubview(label)
                
            } else { //短い目盛りの時
                let shortBar = UIView(frame: bar)
                shortBar.frame.origin.y = windowH - (CGFloat(i) * rect.height)
                shortBar.frame.origin.x = windowW - shortBar.frame.size.width
                shortBar.backgroundColor = UIColor.darkGray
                bars.append(shortBar)
                self.view.addSubview(shortBar)
            }
        }
        self.view.setNeedsDisplay()
    }
    
    //上部に定規を表示する
    func drawRulerTop() {
        let bar = TSRect(x: 0, y: 0, width: 0.2, height: 10, unit: .mm).cgrect
        let labelRect = TSRect(x: 0, y: 17, width: 4, height: 4).cgrect
        let count: Int = Int(windowW / rect.width) + 1
        
        resetArray()
        
        for i in (0 ..< count) {
            if i % 10 == 0 { //長い目盛りの時
                let longBar = UIView(frame: bar)
                longBar.frame.size.height *= 1.5
                longBar.frame.origin.x = windowW - (CGFloat(i) * rect.width)
                longBar.backgroundColor = UIColor.darkGray
                bars.append(longBar)
                self.view.addSubview(longBar)
                
                let label = UILabel(frame: labelRect)
                label.text = String(Int(i/10))
                //ここを加工して続きからできるようにする
                label.frame.origin.x = windowW - (CGFloat(i) * rect.width)
                label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                label.frame.origin.x += 5
                
                labels.append(label)
                self.view.addSubview(label)
                
            } else {
                //短い目盛りの時
                let shortBar = UIView(frame: bar)
                shortBar.frame.origin.x = windowW - (CGFloat(i) * rect.width)
                shortBar.backgroundColor = UIColor.darkGray
                bars.append(shortBar)
                self.view.addSubview(shortBar)
            }
        }
        self.view.setNeedsDisplay()
    }
}
