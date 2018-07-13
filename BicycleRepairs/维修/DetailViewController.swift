//
//  DetailViewController.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/3.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKUIDelegate,WKNavigationDelegate,UIWebViewDelegate {

    var webView:WKWebView?
    var urlArr = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
//        setUpWKwebView()
        loadDataHtml()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // 创建webview
    func setUpWKwebView() {
    
        let webview = WKWebView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-64))
        let url = NSURL(string: "http://www.ttgozg.com/news-1111.html")
        let request = NSURLRequest.init(url: url! as URL)
        webview.load(request as URLRequest)
        self.view.addSubview(webview)
        self.view.addSubview(progressView)
        self.webView = webview
        self.webView?.uiDelegate = self
        self.webView?.navigationDelegate = self
        
        self.webView?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    // 进度条
    private  lazy var progressView:UIProgressView = {
        self.progressView = UIProgressView.init(frame: CGRect.init(x: 0, y: 1, width: view.frame.size.width, height: 2))
        self.progressView.tintColor = UIColor.blue
        self.progressView.trackTintColor = UIColor.white
        return  self.progressView
        
    }()
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //  加载进度条
        if keyPath == "estimatedProgress"{
            progressView.alpha = 1.0
            progressView.setProgress(Float((self.webView?.estimatedProgress) ?? 0), animated: true)
            if (self.webView?.estimatedProgress ?? 0.0)  >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        let toast = ToastView()
        toast.showLoadingDlg()
        
    }
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!){
        
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    deinit {
        self.webView?.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView?.uiDelegate = nil
        self.webView?.navigationDelegate = nil
    }
    
    func loadDataHtml() {
        // http://www.biketo.com/product/31886.html?all=1#page_0
        let url = URL(string: "http://www.biketo.com/product/31886.html?all=1#page_0")
        let request = URLRequest(url: url! as URL)
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                print(jsonData)
            }
        }
        dataTask.resume()
            
    }
        
        
    
    
    
    
    
    
    


}
















