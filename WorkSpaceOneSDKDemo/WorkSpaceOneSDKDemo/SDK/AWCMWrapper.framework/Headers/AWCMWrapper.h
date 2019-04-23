//
//  AWCMWrapper.h
//  AWCMWrapper
//
//  Copyright © 2016 VMware, Inc. All rights reserved. This product is protected
//  by copyright and intellectual property laws in the United States and other
//  countries as well as by international treaties. VMware products are covered
//  by one or more patents listed at http://www.vmware.com/go/patents.
//

#import <Foundation/Foundation.h>

//! Project version number for AWCMWrapper.
FOUNDATION_EXPORT double AWCMWrapperVersionNumber;

//! Project version string for AWCMWrapper.
FOUNDATION_EXPORT const unsigned char AWCMWrapperVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <AWCMWrapper/PublicHeader.h>


#import "AWX509Wrapper.h"
#import "AWPKCS7Cryptor.h"
#import "AWCMSCryptor.h"
#import "AWOCSPResponse.h"
#import "AWPKCS12Helper.h"
#import "AWSCEPClient.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnullability-completeness"
BOOL AWGenerateRSAKeyPair(int keySizeInBits, NSData **publicKey, NSData **privateKey);

void AWEnableFIPSMode(void);
void AWDisableFIPSMode(void);

/**
 @brief This function adds, removes, or changes a passphrase.
 
 @discussion Two typical scenarios...
 * Upgrade scenario - is used for pre 17.1, change the passphrase which used to be NSData to a String.
 * Add a passphrase - If there is no passphrase on the key, then add one with the newPassphrase.
 
 @param key The DER key in PKCS8 fromat as NSData
 
 @param oldPassphrase The old passphrase used to wrap the DER with
 
 @param newPassphrase The new passphrase to wrap the DER with
 
 @return NSData The DER is PKCS8 with the new passphrase using the newPassphrase string. NULL will be returned if there is an error
 */
NSData* _Nullable AWUpdateKeyPassphrase(NSData* _Nonnull key, NSData* _Nullable oldPassphrase, NSString* _Nullable newPassphrase);

#pragma clang diagnostic pop
