//
//  GeneralInfoViewController.swift
//  WorkSpaceOneSDKDemo
//
//  Created by yang.sun on 2019/1/22.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

import UIKit
import AWSDK
class GeneralInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor .white;
        
        let textview = UITextView(frame:CGRect(x:100,y:100,width:200,height:200))
        self.view.addSubview(textview)
        
        textview.backgroundColor = UIColor.lightGray
        // 字体设置
        textview.textAlignment = NSTextAlignment.left
        textview.textColor = UIColor.red
        textview.font = UIFont(name: "GillSans", size: 15.0)
        
        var  userstring = ""
        
        
        /*######################################################*/
        //获取用户信息
        UserInformationController.sharedInstance.retrieveUserInfo { [weak self] (userInformation, error) in
            guard let weakself = self else {
                AWLogError("Controller got deallocated to display result")
                return
            }
            
            guard
                let userInformation = userInformation,
                error == nil
                else {
                    AWLogError("Error fetching information: \(error.debugDescription)")
                    return
            }
            
            userstring = "username : "+userInformation.userName+"groupID:"+userInformation.groupID+"email:"+userInformation.email+"UserID"+userInformation.userIdentifier
//            String += "username : "+=userInformation.userName
            
            DispatchQueue.main.async {
            textview.text = userstring
        }
            
            //得到相应信息
            print("username : ",userInformation.userName,"groupID:",userInformation.groupID,"email:",userInformation.email,"UserID",userInformation.userIdentifier)
            
            
        }
        
        //获取设备信息
        DeviceInformationController.sharedController.fetchDeviceInformation {
            (deviceInformation, error) in
            
            guard
                let deviceInformation = deviceInformation,
                error == nil
                else {
                    AWLogError("Error fetching information: \(error.debugDescription)")
                    
                    return
            }
            
            //相应信息
            print("注册信息：",deviceInformation.enrollmentStatus)
            
        }
        
        
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(dismissKeyboard))
        
        self.view.addGestureRecognizer(tap)
        
        
    }
    
    override func dismissKeyboard() {
        self.dismiss(animated: true, completion: nil)
    }
    

}
