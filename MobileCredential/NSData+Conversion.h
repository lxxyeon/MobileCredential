//
//  NSData+Conversion.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData_Conversion : NSObject

#pragma mark - String Conversion
- (NSString *)realTimeString;
- (NSString *)hexadecimalString;

@end

NS_ASSUME_NONNULL_END
