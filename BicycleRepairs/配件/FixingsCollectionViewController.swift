//
//  FixingsCollectionViewController.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/23.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit

private let kEdgeMargin:CGFloat = 40
private let kItemW:CGFloat = (ScreenWidth - 2*kEdgeMargin)/4
private let kItemH:CGFloat = kItemW*6 / 5

// 配件界面
class FixingsCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var collection:UICollectionView!
    var layout = UICollectionViewFlowLayout()
 private func setUI()  {
    
    collectionView?.register(FixsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionView?.register(FixsLastCollectionViewCell.self, forCellWithReuseIdentifier: "lastcell")
    collectionView?.backgroundColor = UIColor.brown
    collectionView?.dataSource = self
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    view.backgroundColor = UIColor.white
    self.tabBarController?.tabBar.isHidden = true
    self.title = "配件"
        setUI()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: UICollectionViewDataSource
    let dataArr = [1,2,3,4,5,6,7,8,9,0]

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        if indexPath.row == dataArr.count-1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "lastcell", for: indexPath) as! FixsLastCollectionViewCell
            cell.imgV.image = UIImage(named: "Add.png")
            cell.contentView.backgroundColor = UIColor.arc4randomColor()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FixsCollectionViewCell
            cell.labT.text = "自行车链条"
            cell.contentView.backgroundColor = UIColor.arc4randomColor()
            return cell
        }
        
        
    }

    // MARK: ---------- UICollectionViewDelegate  ---------
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == dataArr.count-1 {
            let FixInputVC = FixsInputViewController()
            self.navigationController?.pushViewController(FixInputVC, animated: true)
        }
    }
    
    
    // MARK: ---------- UICollectionViewDelegateFlowLayout --------------
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kItemW, height: kItemH)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  UIEdgeInsets(top: 50.0, left: 0.0, bottom: 50.0, right: 20.0).right
    }
    
}




