//
//  FristComeViewController.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/22.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit

typealias BaseBlock = (_ obj: Any?) -> Void

class FristComeViewController: UIViewController {

    var baseBlock: BaseBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageStr = ["firstCome1", "firstCome2", "firstCome3"]
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        scrollView.isPagingEnabled = true
        scrollView.bounces = false;
        scrollView.contentSize = CGSize(width: ScreenWidth*CGFloat(imageStr.count), height: ScreenHeight)
        self.view.addSubview(scrollView)
        
        for i in 0..<imageStr.count {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i)*ScreenWidth, y: 0, width: ScreenWidth, height: ScreenHeight))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: imageStr[i])
            scrollView.addSubview(imageView)
            if i == imageStr.count - 1 {
                let comeInButton = UIButton(type: .custom)
                comeInButton.addTarget(self, action: #selector(comeInButtonSelect), for: .touchUpInside)
                comeInButton.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
                imageView.addSubview(comeInButton)
                imageView.isUserInteractionEnabled = true
            }
        }
        
    }
    
    @objc func comeInButtonSelect() {
        
        UserDefaults.standard.set("firstComeIn", forKey: FirstComeIn)
        if let block = self.baseBlock {
            block("")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
