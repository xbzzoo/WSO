//
//  ProfilePayload.h
//  AirWatchServices
//
//  Copyright © 2018 VMware, Inc. All rights reserved. This product is protected
//  by copyright and intellectual property laws in the United States and other
//  countries as well as by international treaties. VMware products are covered
//  by one or more patents listed at http://www.vmware.com/go/patents.
//


@import Foundation;

/**
 * @brief       An abstract class that is used to represent profile payloads.
 * @details     Abstract class used for subclasses to inherit from. Subclasses must implement all methods.
 * @version     6.0
 */
@interface AWProfilePayload : NSObject

/**
 * @brief The designated intializer to create a profile payload.
 * @param dictionary A dictionary representation of a profile payload.
 * @return A newly initialized profile payload.
 */
- (nonnull id) initWithDictionary:(nonnull NSDictionary<NSString*, id> *)dictionary NS_DESIGNATED_INITIALIZER;

/**
 * @brief The profile type in the format of a string.
 * @return Profile type text.
 */
+ (nullable NSString *)payloadType;

/**
 * @brief The profile type in the format of a string.
 * @return Profile type text.
 */
+ (nullable NSString *)payloadTypeV2 DEPRECATED_MSG_ATTRIBUTE("All payloads are now V2; use payloadType instead");

- (nonnull NSDictionary<NSString*, id> *)toDictionary;

- (nullable NSString *)stringFromDictionaryForKey:(nonnull NSString *)key DEPRECATED_ATTRIBUTE;    
@end
