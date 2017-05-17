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
    
    //let myNativeBoundSize: CGSize = UIScreen.main.nativeBounds.size
    
    //変数var
    var squares = [UIView]()
    var labels = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //定数 let
        let windowW: CGFloat = self.view.bounds.width
        let windowH: CGFloat = self.view.bounds.height
        let rect = TSRect(x: 0, y: 95, width: 1, height: 10, unit: .mm).cgrect
        var bar = TSRect(x: 0, y: 95, width: 0.2, height: 10, unit: .mm).cgrect
        var labelRect = TSRect(x: 17, y: 0, width: 4, height: 4).cgrect
        let count: Int = Int(windowW / rect.width) * 10
        
        for i in (0 ..< count + 1) {
            bar.origin.x = CGFloat(i) * rect.width
            let square = UIView(frame: bar)
            if i%10==0 {
                
                square.frame.size.height *= -1.5
                square.transform.translatedBy(x: 0, y: 100)
                labelRect.origin.x = CGFloat(i) * rect.width
                let label = UILabel(frame: labelRect)
                label.text = String(Int(i/10))
                label.frame.origin.x -= 5
                labels.append(label)
                self.view.addSubview(label)
            }
            square.backgroundColor = UIColor.darkGray
            squares.append(square)
            self.view.addSubview(square)
        }
    }
    
    
}
