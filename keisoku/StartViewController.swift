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
    
    //変更するvar
    var squares = [UIView]()
    var labels = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //変更しない let
        let windowH: CGFloat = self.view.bounds.height
        let rect = TSRect(x: 0, y: 0, width: 10, height: 1, unit: .mm).cgrect
        var bar = TSRect(x: 0, y: 0, width: 10, height: 0.2, unit: .mm).cgrect
        var labelRect = TSRect(x: 17, y: 0, width: 4, height: 4).cgrect
        let count: Int = Int(windowH / rect.height) * 10
        
        for i in (0 ..< count + 1) {
            bar.origin.y = CGFloat(i) * rect.height
            let square = UIView(frame: bar)
            if i%10==0 {
                square.frame.size.width *= 1.5
                labelRect.origin.y = CGFloat(i) * rect.height
                let label = UILabel(frame: labelRect)
                label.text = String(Int(i/10))
                label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
                label.frame.origin.y -= 5
                labels.append(label)
                self.view.addSubview(label)
            }
            square.backgroundColor = UIColor.darkGray
            squares.append(square)
            self.view.addSubview(square)
        }
    }
    
    
}
