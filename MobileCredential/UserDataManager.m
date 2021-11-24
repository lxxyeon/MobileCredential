//
//  UserDataManager.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/24.
//

#import "UserDataManager.h"

@implementation UserDataManager

+ (instancetype)sharedInstance {
    static UserDataManager *shared = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[UserDataManager alloc] init];
    });

    return shared;
}

// 로그인 수행

@end
