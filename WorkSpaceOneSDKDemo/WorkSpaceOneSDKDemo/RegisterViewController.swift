//
//  RegisterViewController.swift
//  WorkSpaceOneSDKDemo
//
//  Created by yang.sun on 2019/1/22.
//  Copyright © 2019年 yang.sun. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,URLSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let textField1 = UITextField(frame: CGRect(x:30, y:100, width:200, height:30))
        textField1.placeholder = "请输入user";
        textField1.backgroundColor = UIColor.green
        
        let textField2 = UITextField(frame: CGRect(x:30, y:150, width:200, height:30))
        textField2.placeholder = "请输入firstName";
        textField2.backgroundColor = UIColor.green
        
        self.view .addSubview(textField1)
        self.view .addSubview(textField2)
        
       
        let tbutton:UIButton = UIButton(type:.contactAdd)
        
        tbutton.frame = CGRect(x:10, y:250, width:200, height:30)
        
        tbutton.setTitle("预注册", for:.normal)
        self.view.addSubview(tbutton)
        tbutton.addTarget(self, action: #selector(someFunction), for: .touchUpInside)

    }
    
    //预注册接口 返回data 为注册时使用的链接
    @objc func someFunction() {
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            
            ]
        let userstring = "user="+"111"
        let firststring = "&firstName="+"222"
        
        let postData = NSMutableData(data: userstring.data(using: String.Encoding.utf8)!)
        postData.append(firststring.data(using: String.Encoding.utf8)!)
        postData.append("&lastName=demo".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://106.14.218.173:3002/emm/")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                
            } else {
                let responseStr = String(data: data!,
                                         encoding: String.Encoding.utf8)
                print(responseStr!) //包体数据
                
                
                
            }
        })
        
        dataTask.resume()
    }
    
    
    

}
