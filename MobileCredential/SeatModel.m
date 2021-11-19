//
//  SeatModel.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/19.
//

#import "SeatModel.h"

@implementation SeatModel
-(id) init
{
    self = [super init];
    if (self) {
        _seatId = @"";
        _seatNo = @"";
        _workPlaceId = @"";
        _NFCUID = @"";
    }
    return self;
}
@end
