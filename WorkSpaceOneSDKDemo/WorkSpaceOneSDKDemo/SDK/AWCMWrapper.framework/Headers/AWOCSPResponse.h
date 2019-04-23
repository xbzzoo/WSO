//
//  AWOCSPResponse.h
//  AWCMWrapper
//
// Copyright © 2018 VMware, Inc. All rights reserved.
// This product is protected by copyright and intellectual property laws in the United States and other countries as well as by international treaties.
// AirWatch products may be covered by one or more patents listed at http://www.vmware.com/go/patents.
//

#import <Foundation/Foundation.h>
extern NSString *const _Nonnull kOCSPErrorDomain;

typedef NS_ENUM(NSUInteger, OCSPError) {
    OCSPErrorNoResponseFromServer           = 100,
    OCSPErrorInvalidCert                    = 101,
    OCSPErrorInvalidIssuer                  = 102,
    OCSPErrorUnableToCreateCertId           = 103,
    OCSPErrorUnableToCreateRequest          = 104,
    OCSPErrorUnableToAddIdToRequest         = 105,
    OCSPErrorUnableToCreateConnection       = 106,
    OCSPErrorUnableToGetValidFileDescriptor = 107,
    OCSPErrorUnableToCreateSendRequest      = 108,
    OCSPErrorUnableToAddHost                = 109,
    OCSPErrorUnableToSetContext             = 110,
    OCSPErrorUnableToExtractData            = 111,
    OCSPErrorUnableToVerifyNonce            = 112,
    OCSPErrorResponseTimeValidityFailed     = 113,
    OCSPErrorResponseInvalidResponse        = 114

};

@interface AWOCSPResponse : NSObject

@property (nonatomic) BOOL isRevoked;
@property (nonatomic) NSInteger revocationFailureReasonCode;

@property (nonatomic) BOOL isNonceVerified;
@property (nonatomic) BOOL isSigningCertVerified;

@property (nonatomic,nullable) NSDate *thisUpdate;
@property (nonatomic,nullable) NSDate *nextUpdate;
@property (nonatomic,nullable) NSDate *revocationTime;

/**
 failure error while performing an ocsp check
 if error is set, the response is invalid.
 */
@property (nonatomic,nullable) NSError *error;

@property (nonatomic,nullable) NSArray<NSData*> *responseCertsData;
@end
