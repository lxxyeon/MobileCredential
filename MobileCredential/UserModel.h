//
//  UserModel.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/06.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//로그인한 사용자 정보
@interface UserModel : NSObject
//사용자 고유식별번호
@property(nonatomic, strong) NSString *userKey;
//서클아이디
@property(nonatomic, strong) NSString *userId;
@property(nonatomic, strong) NSString *passWord;

@property(nonatomic, strong) NSString *userName;
@property(nonatomic, strong) NSString *userTeam;

@property(nonatomic, assign) NSString *workPlaceId;

@property(nonatomic, strong) NSString *workPlaceName;
@property(nonatomic, strong) NSString *workStartTime;
@property(nonatomic, strong) NSString *userSeat;
@end

NS_ASSUME_NONNULL_END
