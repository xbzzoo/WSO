//
//  Utils.swift
//  Workspace-ONE-SDK-iOS-Swift-Sample
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
//

import Foundation
import AWSDK
import UIKit

extension String {

    // MARK:- Helper methods

    public var domainStrippedUsername: String {
        let usernameComponents = self.components(separatedBy: "\\")
        return usernameComponents.count > 1 ? usernameComponents[1] : self
    }

}

public func ensureOnMainThread(completion: () -> Void) {
    if Thread.isMainThread {
        completion()
    } else {
        DispatchQueue.main.sync(execute: completion)
    }
}

enum LoadingIndicator {
    static func show() -> () {
        ensureOnMainThread {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }

    static func hide() -> () {
        ensureOnMainThread {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

