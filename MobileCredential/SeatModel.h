//
//  SeatModel.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SeatModel : NSObject

@property(nonatomic, strong) NSString *seatId;
@property(nonatomic, strong) NSString *seatNo;
@property(nonatomic, strong) NSString *workPlaceId;
@property(nonatomic, strong) NSString *NFCUID;

@end

NS_ASSUME_NONNULL_END
