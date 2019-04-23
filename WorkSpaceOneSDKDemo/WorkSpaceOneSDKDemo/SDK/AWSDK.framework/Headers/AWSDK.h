//
//  AWSDK.h
//  AWSDK
//
//  Copyright © 2018 VMware, Inc. All rights reserved. This product is protected
//  by copyright and intellectual property laws in the United States and other
//  countries as well as by international treaties. VMware products are covered
//  by one or more patents listed at http://www.vmware.com/go/patents.
//

#import <UIKit/UIKit.h>
#import "AWProfilePayload.h"

//! Project version number for AWSDK.
FOUNDATION_EXPORT double AWSDKVersionNumber;

//! Project version string for AWSDK.
FOUNDATION_EXPORT const unsigned char AWSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <AWSDK/PublicHeader.h>

// Macros for AWLog

#define AWLogError(frmt, ...) [[AWCustomerLogger sharedInstance] logWithError:[NSString stringWithFormat:(frmt), ##__VA_ARGS__]\
                                                                     function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]\
                                                                         file:[NSString stringWithUTF8String:__FILE__]\
                                                                         line:__LINE__]

#define AWLogWarning(frmt, ...) [[AWCustomerLogger sharedInstance] logWithWarning:[NSString stringWithFormat:(frmt), ##__VA_ARGS__]\
                                                                         function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]\
                                                                             file:[NSString stringWithUTF8String:__FILE__]\
                                                                             line:__LINE__]


#define AWLogInfo(frmt, ...) [[AWCustomerLogger sharedInstance] logWithInfo:[NSString stringWithFormat:(frmt), ##__VA_ARGS__]\
                                                                   function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]\
                                                                       file:[NSString stringWithUTF8String:__FILE__]\
                                                                       line:__LINE__]

#define AWLogVerbose(frmt, ...) [[AWCustomerLogger sharedInstance] logWithVerbose:[NSString stringWithFormat:(frmt), ##__VA_ARGS__]\
                                                                         function:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]\
                                                                             file:[NSString stringWithUTF8String:__FILE__]\
                                                                             line:__LINE__]


