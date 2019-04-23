//
//  TunnelingViewController.swift
//  WorkSpaceOneSDKDemo
//
//  Created by yang.sun on 2019/1/22.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

import UIKit
import Foundation

import AWSDK

class TunnelingViewController: UIViewController, UIWebViewDelegate, URLSessionDelegate {
    
    
     //var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        let webView = UIWebView.init(frame:self.view.frame)
        
        //添加
        self.view.addSubview(webView)
        
        //加载网页
        webView.loadRequest(NSURLRequest(url:NSURL.init(string:"http://www.gtja.net") as! URL) as URLRequest)

        
    }
    
    // MARK: UISegmentedControl
    
   
}


extension UIViewController {
    @objc func dismissKeyboard() {
        ensureOnMainThread {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
    }
}

