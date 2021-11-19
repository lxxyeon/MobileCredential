//
//  UserModel.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/06.
//

#import "UserModel.h"

@implementation UserModel

-(id) init
{
    self = [super init];
    if (self) {
        _userKey = @"";
        _userId = @"";
        _userTeam = @"";
        
        _passWord = @"";
        _userName = @"";
        _workPlaceId = @"";
        _workPlaceName = @"";
        _workStartTime = @"";
    }
    return self;
}

@end
