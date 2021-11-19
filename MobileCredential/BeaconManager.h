//
//  BeaconManager.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/06.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  Beacon Manager
 */
@interface BeaconManager : NSObject<CLLocationManagerDelegate>{
}

//위치정보를 저장할 프로퍼티, CLLocationManager로 초기화
@property (strong, nonatomic) CLLocationManager *locationManager;

//거점별 위치정보(여의도,장교,신설...)
@property (strong, nonatomic) CLBeaconRegion *myBeacon1Region;
@property (strong, nonatomic) CLBeaconRegion *myBeacon2Region;
@property (strong, nonatomic) CLBeaconRegion *myBeacon3Region;

@property (strong, nonatomic) CLBeaconIdentityConstraint *beaconIdentityConstraint;
@property (strong, nonatomic) CLBeaconIdentityConstraint *beaconIdentityConstraint2;
@property (strong, nonatomic) CLBeaconIdentityConstraint *beaconIdentityConstraint3;

@property (nonatomic, strong) NSArray *beacons;

// Singleton Pattern
+ (instancetype)shared;

// 비콘 region setting
- (void)BeaconSetting;

// 초기화
- (void)BeaconDetectInit;

// 비콘 모니터
- (void)monitorBeacons;

// 비콘 진입시
- (void)locationManager:(CLLocationManager*)manager didEnterRegion:(CLRegion *)region;

// 비콘 상태
- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region;

// 비콘 정보 읽어오기
- (void)locationManager:(CLLocationManager*)manager didRangeBeacons:(NSArray*)beacons inRegion:(CLBeaconRegion*)region;

// 비콘 발견시 noti
- (void)notiSender: (NSInteger *)place;

@end

NS_ASSUME_NONNULL_END
