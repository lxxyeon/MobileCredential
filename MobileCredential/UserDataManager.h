//
//  UserDataManager.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  UserData Manager
 */
@interface UserDataManager : NSObject

/**
 *  Singleton Pattern
 *
 *  @return 클래스 인스턴스
 */
+ (instancetype)sharedInstance;

@property(nonatomic, retain) UserModel *userVO;

@property(nonatomic, retain) SeatModel *seatDt;

@end

NS_ASSUME_NONNULL_END
