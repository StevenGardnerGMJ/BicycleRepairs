//
//  FixsCollectionViewCell.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/28.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit

class FixsCollectionViewCell: UICollectionViewCell {
    var imgV:UIImageView!
    var labT:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()// 普通cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   private func setupUI() {
        imgV = UIImageView()
        labT = UILabel()
        labT.font = UIFont.systemFont(ofSize: 13.0)
        labT.textAlignment = .center
        labT.textColor = UIColor.black
        self.addSubview(imgV)
        self.addSubview(labT)
        self.backgroundColor = UIColor.white
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame:CGRect = self.bounds
        let imgX:CGFloat = 0.0
        let imgY = imgX
        let frameW:CGFloat = frame.size.width
        let imgW:CGFloat = frameW - (imgX*2.0)
        
        self.imgV.frame = CGRect(x: imgX, y: imgY, width: imgW, height: imgW)
        self.labT.frame = CGRect(x: 0, y: imgY+frameW, width: frameW, height: 20)
        
    }
}

//  MARK:  ---------- Last Cell  -------------------
class FixsLastCollectionViewCell: UICollectionViewCell {
    var imgV:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()// 最后一个cell
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
      imgV = UIImageView()
      self.addSubview(imgV)
      self.backgroundColor = UIColor.white
    }
    override func layoutSubviews() {
        let frame:CGRect = self.bounds
        let imgX:CGFloat = 0.0
        let imgY = imgX
        let frameW:CGFloat = frame.size.width
        let frameY:CGFloat = frame.size.height
        let imgW:CGFloat = frameW
        self.imgV.frame = CGRect(x: imgX, y: imgY, width: imgW, height: imgW)
        self.imgV.center = CGPoint(x: frameW/2.0, y: frameY/2.0)// 居中
    }
    
}








