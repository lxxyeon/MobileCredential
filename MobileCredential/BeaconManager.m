//
//  BeaconManager.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/06.
//

#import "BeaconManager.h"
#import <UserNotifications/UserNotifications.h>

@implementation BeaconManager{
    //여의도 비콘
    NSUUID *iBeacon1uuid;
    CLBeaconMajorValue *iBeacon1Major;
    CLBeaconMinorValue *iBeacon1Minor;
    NSString *iBeacon1Identifier;
    
    //장교 비콘
    NSUUID *iBeacon2uuid;
    CLBeaconMajorValue *iBeacon2Major;
    CLBeaconMinorValue *iBeacon2Minor;
    NSString *iBeacon2Identifier;
    
    //신설 비콘
    NSUUID *iBeacon3uuid;
    CLBeaconMajorValue *iBeacon3Major;
    CLBeaconMinorValue *iBeacon3Minor;
    NSString *iBeacon3Identifier;
    
    NSString *workPlace;
//    DBManager *dbManager;
    UserModel *loginDt;
}

+(instancetype)shared{
    static BeaconManager *shared = nil;
    //dispatch_once_t : 앱이 실행되고 종료될 때까지 단 1회만 실행한다는 것을 보장하며 완벽히 sychronous하게 동작
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[BeaconManager alloc] init];
    });
    return shared;
}

/**
 *  비콘 세팅BeaconManager
 */
- (void) BeaconSetting
{
    self.beacons = [[NSArray alloc] init];
    //첫번째 비콘 - 여의도 (
    //NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"UUID-STRING-HERE"];
    iBeacon1uuid = [[NSUUID alloc] initWithUUIDString:@"e2c56db5-dffb-48d2-b060-d0f5a71096e0"];
    //Bmajor = 40001; >> waring
    iBeacon1Major = (unsigned short *)40001;
    iBeacon1Minor = (unsigned short *)42668;
    iBeacon1Identifier = @"MyBeacon1";
    
    //두번째 비콘 - 장교
    iBeacon2uuid = [[NSUUID alloc] initWithUUIDString:@"e2c56db5-dffb-48d2-b060-d0f5a71096e1"];
    iBeacon2Major = (unsigned short *)40001;
    iBeacon2Minor = (unsigned short *)42704;
    iBeacon2Identifier = @"MyBeacon2";
    
    //세번째 비콘 - 신설
    iBeacon3uuid = [[NSUUID alloc] initWithUUIDString:@"e2c56db5-dffb-48d2-b060-d0f5a71096e0"];
    iBeacon3Major = (unsigned short *)40001;
    iBeacon3Minor = (unsigned short *)42719;
    iBeacon3Identifier = @"MyBeacon3";
}

//MARK:- Beacon Setting
/**
 *  비콘 초기화
 */
//한번만 실행
- (void) BeaconDetectInit {
    
    NSLog(@"BeaconDetectInit");
    [self LocalService];
    self.locationManager.allowsBackgroundLocationUpdates = YES;
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    //location manager에게 전달할 CLBeaconRegion 객체 생성
    self.myBeacon1Region = [[CLBeaconRegion alloc] initWithUUID:iBeacon1uuid
                                                          major:(CLBeaconMajorValue)iBeacon1Major
                                                          minor:(CLBeaconMinorValue)iBeacon1Minor
                                                     identifier:(NSString *)iBeacon1Identifier];
    
    self.myBeacon2Region = [[CLBeaconRegion alloc] initWithUUID:iBeacon2uuid
                                                          major:(CLBeaconMajorValue)iBeacon2Major
                                                          minor:(CLBeaconMinorValue)iBeacon2Minor
                                                     identifier:(NSString *)iBeacon2Identifier];
    
    self.myBeacon3Region = [[CLBeaconRegion alloc] initWithUUID:iBeacon3uuid
                                                          major:(CLBeaconMajorValue)iBeacon3Major
                                                          minor:(CLBeaconMinorValue)iBeacon3Minor
                                                     identifier:(NSString *)iBeacon3Identifier];
    
    
    self.beaconIdentityConstraint = [[CLBeaconIdentityConstraint alloc] initWithUUID:iBeacon1uuid];
    self.beaconIdentityConstraint2 = [[CLBeaconIdentityConstraint alloc] initWithUUID:iBeacon2uuid];
    self.beaconIdentityConstraint3 = [[CLBeaconIdentityConstraint alloc] initWithUUID:iBeacon3uuid];
}


//MARK:- Monitoring
/**
 *  비콘 모니터링
 */
- (void) monitorBeacons{
    NSLog(@"BeaconDetectStart");
    if([CLLocationManager isMonitoringAvailableForClass: CLBeaconRegion.self]){
        //    //해당 notification을 받을 수 있게함
        self.myBeacon1Region.notifyEntryStateOnDisplay = YES;
        
        //
        //    // 영역 안에 들어온 순간이나 나간 순간에 해당 노티피케이션을 받을 수 있게 함
        self.myBeacon1Region.notifyOnExit = YES;
        self.myBeacon1Region.notifyOnEntry = YES;
        
        self.myBeacon2Region.notifyEntryStateOnDisplay = YES;
        self.myBeacon2Region.notifyOnExit = YES;
        self.myBeacon2Region.notifyOnEntry = YES;
        
        //startMonitoringForRegion : region 모니터링 시작
        //didStartMonitoringForRegion 시작
        [self.locationManager startMonitoringForRegion:self.myBeacon1Region];
        [self.locationManager startMonitoringForRegion:self.myBeacon2Region];
        [self.locationManager startMonitoringForRegion:self.myBeacon3Region];
    }else{
        NSLog(@"monitoring is unavailable");
    }
}
/**
 *  비콘 모니터링 - 모니터링이 잘 실행 됐는지 알려줌
 *  @param manager  위치
 *  @param region  비콘 영역
 */
- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager requestStateForRegion:self.myBeacon1Region];
    [self.locationManager requestStateForRegion:self.myBeacon2Region];
    [self.locationManager requestStateForRegion:self.myBeacon3Region];
}
/**
 *  비콘 모니터링 실패 error
 *  @param manager  위치
 *  @param error  NSError
 */
- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    NSLog(@"monitoringDidFailForRegion : %@",error);
}

//MARK:- 비콘 집입, 퇴장 이벤트
/**
 *  비콘 진입 시
 *  @param manager  위치
 *  @param region  비콘 영역
 */
- (void)locationManager:(CLLocationManager*)manager didEnterRegion:(CLRegion *)region
{
    NSLog(@"didEnterRegion");
    [self.locationManager startRangingBeaconsSatisfyingConstraint:self.beaconIdentityConstraint];
    [self.locationManager startRangingBeaconsSatisfyingConstraint:self.beaconIdentityConstraint2];
    [self.locationManager startRangingBeaconsSatisfyingConstraint:self.beaconIdentityConstraint3];
    
    //    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    //    NSString *attendanceMessage = [@"장교" stringByAppendingString:@"07:58"];
    ////    NSString *attendanceMessage2 = [@"07:58" stringByAppendingString:@" 출근"];
    //    content.title = [NSString localizedUserNotificationStringForKey:@"출근" arguments:nil];
    //
    //    content.body = [NSString localizedUserNotificationStringForKey:attendanceMessage
    //                                                         arguments:nil];
    //
    //    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
    //                                                  triggerWithTimeInterval:5 repeats:NO];
    //    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
    //                                                                          content:content trigger:trigger];
    //    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    //
    //    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
    //        if (error != nil) { NSLog(@"%@", error.description); }
    //    }];
}
/**
 *  비콘 영역 밖인 경우
 *  @param manager  위치
 *  @param region  비콘 영역
 */
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    NSLog(@"didExitRegion");
    [self.locationManager stopRangingBeaconsSatisfyingConstraint:self.beaconIdentityConstraint];
    [self.locationManager stopRangingBeaconsSatisfyingConstraint:self.beaconIdentityConstraint2];
    [self.locationManager stopRangingBeaconsSatisfyingConstraint:self.beaconIdentityConstraint3];
}




-(void)notiSender: (NSInteger *)place{
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    NSString *attendanceMessage;
    
    
    NSString *attendanceCheckInTimeString;
    NSDate *attendanceCheckInTime = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd HH:mma"];
    
    [dateFormat setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]];
    attendanceCheckInTimeString = [dateFormat stringFromDate: attendanceCheckInTime];
    attendanceCheckInTimeString = [@"Time   : " stringByAppendingString:attendanceCheckInTimeString];
    
    if (place == 1){
        //        attendanceMessage = [@" 한화빌딩 13F\n" stringByAppendingString:@" 07:45AM"];
        content.title = [NSString localizedUserNotificationStringForKey:@"[ 출근 ]" arguments:nil];
        attendanceMessage = [@"Office : 한화빌딩 13F\n" stringByAppendingString:@"Time  ® : 07:45AM"];
    }else if (place == 2){
        //        attendanceMessage = [@"여의도 손보빌딩 15F, " stringByAppendingString:@"07:45AM"];
        content.title = [NSString localizedUserNotificationStringForKey:@"[ 출근 ]" arguments:nil];
        attendanceMessage = [@"Office : 한화빌딩 13F\n" stringByAppendingString: attendanceCheckInTimeString];
        //seat
    }else if (place == 3){
        //        attendanceMessage = [@"신설사옥 5F, " stringByAppendingString:@"07:45AM"];
        content.title = [NSString localizedUserNotificationStringForKey:@"[ 출근 ]" arguments:nil];
        attendanceMessage = [@"Office : 한화빌딩 13F\n" stringByAppendingString:attendanceCheckInTimeString];
        
    }else if (place == 4){
        //        attendanceMessage = [@"여의도 손보빌딩 15F, " stringByAppendingString:@"07:45AM"];
        content.title = [NSString localizedUserNotificationStringForKey:@"[ 좌석점유 ]" arguments:nil];
        attendanceMessage = [@"Seat : A45\n" stringByAppendingString: attendanceCheckInTimeString];
        NSLog(@"들어왓!");
    }
    else{
        //        attendanceMessage = [@"신설사옥 5F, " stringByAppendingString:@"07:45AM"];
        content.title = [NSString localizedUserNotificationStringForKey:@"[ 출근 ]" arguments:nil];
        attendanceMessage = [@"Office : 한화빌딩 13F\n" stringByAppendingString:attendanceCheckInTimeString];
    }
    
    
    content.body = [NSString localizedUserNotificationStringForKey:attendanceMessage
                                                        arguments:nil];
    content.categoryIdentifier = @"myNotificationCategory";
    
    NSString *imageName = @"Attendance-checked-green";
    
    NSURL *imageURL = [NSBundle.mainBundle URLForResource:imageName withExtension:@".png"];
    NSError *error;
    UNNotificationAttachment *icon = [UNNotificationAttachment attachmentWithIdentifier:@"image" URL:imageURL options:nil error: &error];
    content.attachments = @[icon];
    
    UNNotificationCategory *myNotificationCategory = [UNNotificationCategory categoryWithIdentifier:@"myNotificationCategory" actions:@[] intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    [[UNUserNotificationCenter currentNotificationCenter]setNotificationCategories:[NSSet setWithObjects:myNotificationCategory,nil]];
    
    content.categoryIdentifier = @"myNotificationCategory";
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:2 repeats:NO];
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"ThreeSecond"
                                                                          content:content trigger:trigger];
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) { NSLog(@"%@", error.description); }
    }];
    
    
    
}
/**
 *  비콘 상태 정보 매니저
 *  @param manager  위치
 *  @param state 상태
 *  @param region  비콘 영역
 */
-(void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
//    if (state == CLRegionStateInside) {
//        NSLog(@"!!!!!!!!!!!CLRegionStateInside");
//        
//        
//        dbManager = [DBManager shared];
//        [dbManager openDB:DB_NAME];
//        
//        CLBeaconRegion *beaconRegion =(CLBeaconRegion *) region;
//        //        NSLog(@"%@", beaconRegion.UUID);
//        
//        if ([dbManager.fmDatabase open]) {
//            //1. uuid check
//            NSString *strSQLQueryToGetDataFromTable = [NSString stringWithFormat:@"SELECT * FROM WORKPLACE WHERE uuid = \"%@\" ",beaconRegion.UUID];
//            FMResultSet *fmResultSet = [dbManager.fmDatabase executeQuery: strSQLQueryToGetDataFromTable];
//            if (!fmResultSet) {
//                NSLog(@"%s: executeQuery failed: %@", __FUNCTION__, [dbManager.fmDatabase lastErrorMessage]);
//                return;
//            }
//            if ([fmResultSet next]) {
//                //2. minor check
//                NSString *strSQLQueryToGetDataFromTable2 = [NSString stringWithFormat:@"AND minorId= \"%@\"", beaconRegion.minor];
//                strSQLQueryToGetDataFromTable = [strSQLQueryToGetDataFromTable stringByAppendingString:strSQLQueryToGetDataFromTable2];
//                //                NSLog(@"%@",  strSQLQueryToGetDataFromTable);
//                
//                fmResultSet = [dbManager.fmDatabase executeQuery: strSQLQueryToGetDataFromTable];
//                
//                NSString *iBeacon1MinorValue = @"42668";
//                NSString *iBeacon2MinorValue = @"42704";
//                //                NSString *iBeacon3MinorValue = @"42719";
//                
//                NSString *minorStringValue = [beaconRegion.minor stringValue];
//                NSDateFormatter *today = [[NSDateFormatter alloc] init];
//                [today setDateFormat: @"yyyy-MM-dd"];
//                NSString *todayDate = [today stringFromDate: [NSDate date]];
//                //                NSLog(@"%@",todayDate);
//                NSDictionary* dict;
//                
//                
//                NSString *attendanceCheckInTimeString;
//                NSDate *attendanceCheckInTime = [NSDate date];
//                NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init] autorelease];
//                [dateFormat setDateFormat:@"HH:mm"];
//                [dateFormat setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"] autorelease]];
//                attendanceCheckInTimeString = [dateFormat stringFromDate: attendanceCheckInTime];
//                loginDt = [UserModel new];
//                [loginDt setWorkPlaceId: @"0"];
//                
//                
//                if ([minorStringValue isEqual: iBeacon1MinorValue]) {
//                    
//                    NSLog(@"장교");
//                    
//                    [self notiSender: 1];
//                    
//                    [loginDt setWorkPlaceId: @"1"];
//                    dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                            @"date", todayDate,
//                            @"userKey", @"1",
//                            @"workPlaceId", @"1",
//                            @"attendanceCheckInTime", attendanceCheckInTimeString,
//                            @"attendanceCheckOutTime", @"00:00",
//                            nil];
//                    
//                }else if([minorStringValue isEqual: iBeacon2MinorValue]){
//                    NSLog(@"여의도");
//                    
//                    [self notiSender: 2];
//                    
//                    
//                    [loginDt setWorkPlaceId: @"2"];
//                    dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                            @"date", todayDate,
//                            @"userKey", @"1",
//                            @"workPlaceId", @"2",
//                            @"attendanceCheckInTime", attendanceCheckInTimeString,
//                            @"attendanceCheckOutTime", @"00:00",
//                            nil];
//                    
//                }else {
//                    NSLog(@"신설");
//                    [self notiSender: 3];
//                    [loginDt setWorkPlaceId: @"3"];
//                    dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                            @"date", todayDate,
//                            @"userKey", @"1",
//                            @"workPlaceId", @"3",
//                            @"attendanceCheckInTime", attendanceCheckInTimeString,
//                            @"attendanceCheckOutTime", @"00:00",
//                            nil];
//                }
//                [dbManager insertDataToDBTable:DB_TABLE_ATTENDANCE dict: dict];
//                
//                if (!fmResultSet) {
//                    NSLog(@"%s: executeQuery failed: %@", __FUNCTION__, [dbManager.fmDatabase lastErrorMessage]);
//                    return;
//                }
//            }else {
//            }
//            [dbManager.fmDatabase close];
//        }else {
//            NSLog(@"Unable to open Database");
//        }
//    }else if(state == CLRegionStateOutside){
//        //        NSLog(@"CLRegionStateOutside");
//    }else{
//        //        NSLog(@"CLRegionStateUnknown");
//    }
    //    NSLog(@"%@",workPlace);
}

//MARK:- Ranging
//비콘 정보를 읽어오기
-(void)locationManager:(CLLocationManager*)manager didRangeBeacons:(NSArray*)beacons inRegion:(CLBeaconRegion*)region
{
    //    self.beacons = beacons;
    //    NSLog(@"didRangeBeacon: %lu", [beacons count]);
    //    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive) return;
    //    if([beacons count] == 0) return;
    //
    //    float arrange = 2.0;
    //
    //    //Beacon Infomation
    //    NSNumber *major = [[NSNumber alloc] initWithInt:5];
    //    NSNumber *minor = [[NSNumber alloc] initWithInt:5000];
    //
    //    for(CLBeacon *beacon in beacons)
    //    {
    //        if(beacon.accuracy < arrange && [beacon.major isEqualToNumber:major] && [beacon.minor isEqualToNumber:minor])
    //        {
    //            if(![[NSUserDefaults standardUserDefaults] boolForKey:@"beaconEnterNotify"])
    //            {
    //                NSLog(@"Fire Notification");
    //                NSLog(@"beacon device info[major:%@, minor:%@, accuracy : %.1f]",beacon.major, beacon.minor, beacon.accuracy);
    //
    //            }
    //        }
    //    }
}

/**
 *  위치 정보 사용 method
 */
- (void) LocalService {
    //CLLocationManager로 초기화
    self.locationManager = [[CLLocationManager alloc] init];
    //프로토콜 델리게이트를 self로 지정
    self.locationManager.delegate = self;
    
    
    //따로 메소드 뺴기
    if([CLLocationManager locationServicesEnabled]){
        //        switch (self.locationManager.authorizationStatus){
        //                // The user accepted authorization
        //            case kCLAuthorizationStatusAuthorizedAlways:
        //
        //                // The user denied authorization
        //            case kCLAuthorizationStatusDenied:
        //                NSLog(@"Location services are not allowed for this app");
        //                [self.locationManager requestAlwaysAuthorization];
        //                // The user not determiend authorization
        //            case kCLAuthorizationStatusNotDetermined:
        //
        //                [self.locationManager requestAlwaysAuthorization];
        //
        //            case kCLAuthorizationStatusRestricted:
        //                NSLog(@"Location services are not allowed for this app");
        //
        //                //In use
        //            case kCLAuthorizationStatusAuthorizedWhenInUse:
        //
        //            default:
        //                NSLog(@"Location services are not enabled");
        //        }
        //    }else{
        //        //Access to user location permission denied!
        NSLog(@"위치서비스 사용 가능");
        [self.locationManager requestAlwaysAuthorization];
    }
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    switch (status){
            
        case kCLAuthorizationStatusNotDetermined:
            
            // 권한 확인 전
            
            NSLog(@"권한 획득 여부를 확인하지 않았음.");
            
            break;
            
        case kCLAuthorizationStatusRestricted:
            
            // 위치 정보를 사용한다고 말을 하지 않은 앱. 개발자가 프로젝트에 이 앱은 위치 정보를 사용한다고 설정을 해두지 않은 경우이다
            
            NSLog(@"This app is Restricted");
            
        case kCLAuthorizationStatusDenied:
            
            // 권한 획득 안되었을 경우. 설정에서 off를 하였을 경우에도 포함됨.
            
            NSLog(@"NO or truned off location in Settings");
            
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
            
            // 7이하 버전 권한 획득시, 8이상 버전 백그라운드에서도 사용 가능
            
            NSLog(@"YES. User autohrized background use.");
            
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            
            // 8이상 버전 앱을 사용중일 경우에만 사용 가능
            
            NSLog(@"YES. User has autohrized use only when the app is in the foreground.");
            
            break;
            
        default:
            
            // 이외의 상황인데, 현재는 나올수가 없는 값일듯... 9.2.1 나온 기준.
            
            NSLog(@"What?");
            
            break;
            
    }
    
    
}
@end
