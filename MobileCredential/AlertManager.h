//
//  AlertManager.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  Alert Manager
 */
@interface AlertManager : NSObject
/**
 *  Singleton Pattern
 *
 *  @return 클래스 인스턴스
 */
+(instancetype)shared;

-(void)alertSignInMessage: (NSString*)str;

@end

NS_ASSUME_NONNULL_END
