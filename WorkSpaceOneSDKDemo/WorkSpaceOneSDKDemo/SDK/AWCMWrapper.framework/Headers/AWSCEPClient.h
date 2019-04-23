//
//  AWSCEPClient.h
//  AWCMWrapper
//
//  Copyright © 2017 VMware, Inc. All rights reserved. This product is protected
//  by copyright and intellectual property laws in the United States and other
//  countries as well as by international treaties. VMware products are covered
//  by one or more patents listed at http://www.vmware.com/go/patents.
//

#ifndef AWSCEPClient_h
#define AWSCEPClient_h

#import <Foundation/Foundation.h>

#pragma mark - AWX509KeyType

typedef NS_ENUM(NSInteger, AWX509KeyType) {
    RSA_2048   = 2048,
    RSA_4096   = 4096
};

#pragma mark - AWSCEPEnrollment

@interface AWSCEPEnrollment : NSObject
@property (nonatomic, nonnull) NSURL *url;
@property (nonatomic) AWX509KeyType x509KeyType;
@property (nonatomic) NSInteger x509KeyUsage;
@property (nonatomic, nonnull) NSString *pkcs12Password;
@property (nonatomic, nonnull) NSString *csrPassword;
@property (nonatomic, nonnull) NSString *x509SubjectName;
@property (nonatomic, nullable) NSString *x509SubjectAltName;
@end

#pragma mark - AWSCEPIdentity

@interface AWSCEPIdentity : NSObject
@property (nonatomic, readonly, nonnull) NSData *certificateData;
@property (nonatomic, readonly, nonnull) NSString *certificatePassword;
@end

#pragma mark - AWSCEPErrors

typedef NS_ENUM(NSInteger, AWSCEPEnrollmentError) {
    AWSCEPEnrollmentErrorEmptyData                  = 0x040010,
    AWSCEPEnrollmentErrorIncompleteInfo             = 0x040011,
    AWSCEPEnrollmentErrorIncompleteReplayInfo       = 0x040012,
    AWSCEPEnrollmentErrorBadSCEPRequestURL          = 0x050000,
    AWSCEPEnrollmentErrorMissingResponseMIMEType    = 0x050001,
    AWSCEPEnrollmentErrorSCEPServer                 = 0x050002,
    AWSCEPEnrollmentErrorNetwork                    = 0x900001
};

extern NSErrorDomain _Nonnull const AWSCEPEnrollmentErrorDomain;

#pragma mark - Completion handlers

typedef void(^SCEPEnrollmentCompletion)(AWSCEPIdentity* _Nullable pkcs12, NSData* _Nullable pollingData, NSError* _Nullable error);

#pragma mark - AWSCEPClient

@interface AWSCEPClient : NSObject
+ (instancetype _Nullable)performSCEPEnrollment:(AWSCEPEnrollment* _Nonnull)enrollment
                                   onCompletion:(SCEPEnrollmentCompletion _Nonnull)completion;

+ (instancetype _Nullable)performSCEPEnrollmentWithPollingData:(NSData* _Nonnull)pollingData
                                                  onCompletion:(SCEPEnrollmentCompletion _Nonnull)completion;
@end

#endif /* AWSCEPClient_h */
