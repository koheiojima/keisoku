//
//  StartViewController.swift
//  keisoku
//
//  Created by 小島光平 on 2017/04/28.
//  Copyright © 2017年 小島光平. All rights reserved.
//

import UIKit
import CoreMotion

class StartViewController: UIViewController {
    
    
    let cmManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.distance()
        
    }
    func distance() {
        
        self.cmManager.deviceMotionUpdateInterval = 0.01
        let dt = self.cmManager.deviceMotionUpdateInterval
        var aData = [0.0]
        var vData = [0.0]
        var s = 0.0
        var loopCount = 0
    
    
        self.cmManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue()!) { (data, error) -> Void in
            defer {
                loopCount++
            }
            let motionData = data!
            let x = motionData.userAcceleration.x
            let y = motionData.userAcceleration.y
            let z = motionData.userAcceleration.z
            
            let pa = aData[loopCount]
            let a = cbrt(x * y * z)
            let dv = (a + pa) * dt * 0.5
            aData.append(a)
            
            let pv = vData[loopCount]
            let v = pv + dv
            let ds = (v + dv) * dt * 0.5
            vData.append(v)
            
            s += ds
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            while true {
                NSThread.sleepForTimeInterval(1)
                print("")
                print(aData.last!)
                print(vData.last!)
                print(s)
            }
        }
    }
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
