//
//  AlertHandler.swift
//  Workspace-ONE-SDK-iOS-Swift-Sample
//
//  Copyright © 2018 VMware, Inc.  All rights reserved
//
//  The BSD-2 license (the ìLicenseî) set forth below applies to all parts of the Workspace-ONE-SDK-iOS-Swift
//  project.  You may not use this file except in compliance with the License.
//
//  BSD-2 License
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//      * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//      * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the
//      documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
//  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
//  BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
//  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import Foundation
import UIKit

import AWSDK

enum Alert {
    case authenticationRequired
    case authenticationUnsupported
    case invalidURL
    case unableToFetchUserInfo
    case tryAgain
    case login

    var title: String {
        switch self {
        case .authenticationRequired:
            return "Authentication Required"

        case .authenticationUnsupported:
            return "Authentication Unsupported"

        case .invalidURL:
            return "Invalid URL"

        case .unableToFetchUserInfo:
            return "Failed to Fetch Info"

        case .tryAgain:
            return "Credentials Updated"

        case .login:
            return "Login Error"
        }
    }

    var message: String {
        switch self {
        case .authenticationRequired:
            return "Tunneling was successfull and we were able to hit the endpoint but this URL requires authentication. Please refer the Integrated Authentication ViewController OR access a URL that does not need authentication."

        case .authenticationUnsupported:
            return "Tunneling was successfull and we were able to hit the endpoint but this type of Authentication challenge is not supported by the Workspace ONE SDK."

        case .invalidURL:
            return "Please confrim the formatting of the URL."

        case .unableToFetchUserInfo:
            return "An Error Occured while Workspace ONE SDK was trying to perform Integrated Auth. Please make sure your enrollment credentials have access to this endpoint"

        case .tryAgain:
            return "Credentials Updated successfully, Please try again!"

        case .login:
            return "An Error Occured while Workspace ONE SDK was trying to perform Integrated Auth. Please make sure your enrollment credentials have access to this endpoint"
        }
    }

    var alertController: UIAlertController {
        return UIAlertController(title: self.title,
                                 message: self.message,
                                 preferredStyle: .alert)
    }
}

typealias AlertPresentationCompletion = () -> Void

extension UIAlertController {

    var `default`: UIAlertController {
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { _ in
            AWLogInfo("Dismissed")
        }
        let alertController = self
        alertController.addAction(dismissAction)
        return alertController
    }

    func present(onViewController: UIViewController?, completion: @escaping AlertPresentationCompletion = {}) -> () {
        guard let viewController = onViewController else {
            return
        }
        AWLogInfo("Alert presenting \(String(describing: self.message))")
        DispatchQueue.main.async {
            viewController.present(self, animated: true, completion: completion)
        }
    }
}

