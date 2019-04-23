//
//  ViewController.swift
//  WorkSpaceOneSDKDemo
//
//  Created by yang.sun on 2019/1/22.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

import UIKit
import AWSDK


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /** **/
        
        let button:UIButton = UIButton(type:.contactAdd)
        
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        
        button.setTitle("注册信息", for:.normal)
        self.view.addSubview(button)
        button.addTarget(self, action:#selector(tapped), for:.touchUpInside)
        
        
        let tbutton:UIButton = UIButton(type:.contactAdd)
        
        tbutton.frame = CGRect(x:10, y:250, width:100, height:30)
        
        tbutton.setTitle("AppTunneling", for:.normal)
        self.view.addSubview(tbutton)
        tbutton.addTarget(self, action:#selector(AppTunnelingtaped), for:.touchUpInside)
        
        
        let zbutton:UIButton = UIButton(type:.contactAdd)
        
        zbutton.frame = CGRect(x:10, y:350, width:100, height:30)
        
        zbutton.setTitle("注册二维码", for:.normal)
        self.view.addSubview(zbutton)
        zbutton.addTarget(self, action:#selector(qrCodetaped), for:.touchUpInside)
    }
    @objc func tapped(){
        let vc = GeneralInfoViewController()
        
        present(vc, animated: true, completion: nil)
    }
    
    @objc func AppTunnelingtaped(){
        
        let vc = TunnelingViewController()
        present(vc, animated: true, completion: nil)
        
    }
    
    @objc func qrCodetaped(){
        
        let vc = RegisterViewController()
        present(vc, animated: true, completion: nil)
        
    }
}

//www.gtja.net
