//
//  SettingTableviewController.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/17.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit
import MessageUI
class SettingTableviewController: UITableViewController,MFMailComposeViewControllerDelegate {

    @IBOutlet weak var fixingsBtn: UIButton!
   
    @IBOutlet weak var vehicleBtn: UIButton!
    
    @IBOutlet weak var friendBtn: UIButton!
    
    @IBOutlet weak var carNumBtn: UIButton!
  // 意见与建议
    @IBOutlet weak var suggestCell_A: UITableViewCell!
    @IBOutlet weak var suggestCell_B: UITableViewCell!
    @IBOutlet weak var suggestCell_C: UITableViewCell!
    @IBOutlet weak var suggestCell_D: UITableViewCell!
    @IBOutlet weak var suggestCell_E: UITableViewCell!
    // 关于作者
    @IBOutlet weak var appStoreCell: UITableViewCell!
    @IBOutlet weak var feedBackCell: UITableViewCell!
    @IBOutlet weak var contactCell: UITableViewCell!
    @IBOutlet weak var userGuideCell: UITableViewCell!
    @IBOutlet weak var versionCell: UITableViewCell!
    
    @IBAction func FixingsBtn(_ sender: Any) {
        print("配件")
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 10
//        layout.itemSize = CGSize(width: 40, height: 50)
        let fixsVC = FixingsCollectionViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(fixsVC, animated: true)
    }
    @IBAction func VehicleBtn(_ sender: Any) {
        let keepVC = KeepViewController()
        
        self.navigationController?.pushViewController(keepVC, animated: true)
        
        print("保养")
    }
    @IBAction func CarNumberBtn(_ sender: Any) {
        print("车库")
    }
    @IBAction func FriendBtn(_ sender: Any) {
        print("车友")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headBtnSetting()// Btn
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 添加上图下标题 Btn
    func headBtnSetting(){
        headerBtnSet(btn: fixingsBtn)
        headerBtnSet(btn: vehicleBtn)
        headerBtnSet(btn: friendBtn)
        headerBtnSet(btn: carNumBtn)
    }
    
    // 四个Btn进行设置 上图下标题
    func headerBtnSet(btn:UIButton)  {
        btn.titleEdgeInsets = UIEdgeInsetsMake((btn.imageView?.frame.size.height)!+5, -CGFloat((btn.imageView?.bounds.size.width)!), 0,0)
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, (btn.titleLabel?.frame.size.width)!/2, (btn.titleLabel?.frame.size.height)!+5, -CGFloat((btn.titleLabel?.frame.size.width)!/2))
        
    }
    
    

    // MARK: - Table view data source

    var arraySetting:Array = ["意见反馈","在App Store评论","联系作者","用户指导","当前版本"]
    
    fileprivate struct About {
        static let eMailURL = "wawasummer@126.com"
        // App ID = ?
        static let App_ID:String = "1378004614"
        static let appStoreURL = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=\(App_ID)&pageNumber=0&sortOrdering=2&mt=8"
        static let homepageURL = "电话157-1886-7368，\n wawasummer@126.com, \n QQ:525884052！"
        static let homepageTitle = "广告合作"
        static let versionURL = "版本1.1"
        static let versionURL2 = "简介：<别人家的自行车是摆在路边的，咱们的自行车是挂在客厅的，会骑自行车已经不再重要，重要的是你如何保养自行车，如何在不同的地形选装不同的设备>。"
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)!
        switch cell {
        // 意见与建议
        case suggestCell_A:jumpEmail(About.eMailURL)
        case suggestCell_B:jumpEmail(About.eMailURL)
        case suggestCell_C:jumpEmail(About.eMailURL)
        case suggestCell_D:jumpEmail(About.eMailURL)
        case suggestCell_E:jumpEmail(About.eMailURL)
        // 关于作者
        case appStoreCell: openURL(About.appStoreURL)
        case feedBackCell: jumpEmail(About.eMailURL)
        case contactCell: jumpAlert(About.homepageTitle, About.homepageURL)
        case userGuideCell:guideUser()
        default:return
        }
    }
    
    fileprivate func guideUser() {
       // 首次启动APP时 的引导页指导用户如何使用APP
    }
    
    fileprivate func openURL(_ url: String) {
        let application = UIApplication.shared
        
        if let url = URL(string: url) {
            //            application.openURL(url)
            if #available(iOS 10.0, *) {
                application.open(url, options:[:] , completionHandler: nil)
            } else {
                // Fallback on earlier versions
                application.openURL(url)
            }
        }
    }
    
    fileprivate func jumpAlert(_ word:String,_ title:String) {
        let alertVC = UIAlertController(title: title, message: word, preferredStyle: .alert)
        let sure = UIAlertAction(title: "确定", style: .destructive, handler: nil)
        alertVC.addAction(sure)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    fileprivate func jumpEmail(_ url:String) {
        print("意见反馈")
        if MFMailComposeViewController.canSendMail() {
            let mailVC = mailFeedBack(url)
            self.present(mailVC, animated: true, completion: nil)
        } else {
            showSendMailErrorAlert()//无邮箱账户容错处理
        }
    }
    
    // 邮箱反馈
    func mailFeedBack(_ url:String) -> MFMailComposeViewController{
        
        // 获取设备名称
        let deviceName = UIDevice.current.name
        // 获取系统版本号
        let systemVersion = UIDevice.current.systemVersion
        // 获取设备的型号
        let modelName = UIDevice.current.modelName
        // 获取设备唯一标识符
        //        let deviceUUID = UIDevice.current.identifierForVendor?.uuidString
        
        
        // 调用
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["< \(url) >"])
        mailComposeVC.setSubject("邮件主题:建议与意见")
        mailComposeVC.setMessageBody("反馈的内容:\n\n\n\n\n 设备名称:\(deviceName)\n 系统版本：\(systemVersion)\n 设备型号：\(modelName)", isHTML: false)
        return mailComposeVC
    }
    // 对邮箱容错处理
    func showSendMailErrorAlert(){
        let mailErrorAlert = UIAlertController(title: "无法发送", message: "陛下您的手机邮箱没有设置账户", preferredStyle: UIAlertControllerStyle.alert)
        mailErrorAlert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { _ in }))
        self.present(mailErrorAlert, animated: true, completion: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.sent.rawValue:
            print("发送成功")
        case MFMailComposeResult.cancelled.rawValue:
            print("发送失败")
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
}










