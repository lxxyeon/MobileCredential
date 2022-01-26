//
//  NFCManager.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/22.
//

#import "NFCManager.h"
@interface NFCManager(){
    NSString *tag1DataStr;
    UserModel *loginDt;
    SeatModel *seatDt;
    DBManager *dbManager;
}
@end

@implementation NFCManager
///NDEF Tag 데이터가 있는 nfc만 reader 가능


+(instancetype)shared{
    static NFCManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[NFCManager alloc] init];
    });
    return shared;
}

#pragma mark - NFCTagReaderSessionDelegate Methods
/**
 *  태그를 성공적으로 읽은 경우
 *
 *  @param session NFCNDEFReaderSession
 *  @param tags  tags
 */
- (void)tagReaderSession:(NFCTagReaderSession *)session didDetectTags:(NSArray<__kindof id<NFCTag>> *)tags API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos, macos, tvos) {
    
    NSLog(@"reader：%s===%@", __FUNCTION__, tags);
    if (tags.count > 1) {
        [session setAlertMessage:@"More than 1 tag is detected, please remove all tags and try again."];
        NSTimeInterval retryInterval = 500;
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, retryInterval), ^{
            [session restartPolling];
        });
        [session restartPolling];
        return;
    }
    
    // Connect to the found tag and perform NDEF message reading
    id<NFCTag> tag = tags[0];
    [session connectToTag:tag completionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            [session setAlertMessage:@"Unable to connect to tag."];
            [session invalidateSession];
            return;
        }
        id<NFCMiFareTag> miFareTag = tag.asNFCMiFareTag;
        NSData *serial = [miFareTag identifier];
        if (serial != nil) {
            self->tag1DataStr= [serial hexadecimalString];
            NSLog(@"reader：%s=== hexadecimal string =%@", __FUNCTION__, self->tag1DataStr);
            
            SeatModel *seat = [SeatModel new];
            [seat setNFCUID: self->tag1DataStr];
            [[UserDataManager sharedInstance] setSeatDt:seat];
            
            NSString *message = [NSString stringWithFormat:@"Successfully linked tag: %@", self->tag1DataStr];
            [session setAlertMessage:message];
            [session invalidateSession];
            return;
        }
        [self dataParsing];
        [session invalidateSession];
    }];
    
}
- (void)dataParsing{
//    [self fetchDataFromTable:DB_TABLE_SEAT];
//    loginDt = [UserDataManager sharedInstance].userVO;
//    seatDt = [UserDataManager sharedInstance].seatDt;
//    NSLog(@"%@", seatDt.NFCUID);
//
//    dbManager = [DBManager shared];
//    [dbManager openDB:DB_NAME];
//
//
//    if ([dbManager.fmDatabase open]) {
//        //1. nfc 태그 확인
//        NSString *strSQLQueryToGetDataFromTable = [NSString stringWithFormat:@"SELECT * FROM SEATCHECKIN WHERE seatID = \"%@\" ", seatDt.seatId];
//        FMResultSet *fmResultSet = [dbManager.fmDatabase executeQuery: strSQLQueryToGetDataFromTable];
//        if (!fmResultSet) {
//            NSLog(@"%s: executeQuery failed: %@", __FUNCTION__, [dbManager.fmDatabase lastErrorMessage]);
//            return;
//
//            if ([fmResultSet next]) {
//                //2. 체크인 여부 확인
//                NSString *strSQLQueryToGetDataFromTable2 = [NSString stringWithFormat:@"AND seatCheckIn= \"%@\"", @"NO"];
//                strSQLQueryToGetDataFromTable = [strSQLQueryToGetDataFromTable stringByAppendingString:strSQLQueryToGetDataFromTable2];
//                //                NSLog(@"%@",  strSQLQueryToGetDataFromTable);
//                fmResultSet = [dbManager.fmDatabase executeQuery: strSQLQueryToGetDataFromTable];
//
//                if ([fmResultSet next]) {
//
//                    NSDateFormatter *today = [[NSDateFormatter alloc] init];
//                    [today setDateFormat: @"yyyy-MM-dd"];
//                    NSString *todayDate = [today stringFromDate: [NSDate date]];
//                    //        NSLog(@"%@", today);
//
//
//                    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
//                                          @"seatCheckInId", 1,
//                                          //                          @"date", @"2021-01-11",
//                                          @"date", todayDate,
//                                          @"seatCheckIn", @"YES",
//                                          //                          @"userKey", loginDt.userKey,
//                                          //                          @"seatId", seatDt.seatId ,
//                                          @"userKey", @"1",
//                                          @"seatId", @"1000" ,
//                                          nil];
//                    [dbManager insertDataToDBTable:DB_TABLE_SEATCHECKIN dict: dict];
//                }else{
//                    NSLog(@"이미 예약된 좌석");
//                }
//            }
//        }
//    }
}

/**
 *  오류가 발생하거나 제한시간(60초) 도달 시
 *
 *  @param session NFCNDEFReaderSession
 *  @param error error
 */
- (void)tagReaderSession:(NFCTagReaderSession *)session didInvalidateWithError:(NSError *)error API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos, macos, tvos) {
}


#pragma mark - NFCNDEFReaderSessionDelegate Methods
- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages {
    NSLog(@"reader：%s===%@", __FUNCTION__, messages);
    NSLog(@"session : %@", session);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"session : %@", session);
        [self.detectedMessages addObjectsFromArray:messages];
        
        NSLog(@"detectedMessages %@", self.detectedMessages);
        
        NSArray *foundTags = [session valueForKey:@"_foundTags"];
        NSObject *tag = foundTags[0];
        NSData *uuid = [tag valueForKey:@"_tagID"];
        NSLog(@"uuid : %@", uuid);
    });
}

- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);
}

- (void)readerSessionDidBecomeActive:(NFCNDEFReaderSession *)session  API_AVAILABLE(ios(11.0)){
    
}

- (void)readerSession:(NFCNDEFReaderSession *)session didDetectTags:(NSArray<__kindof id<NFCNDEFTag>> *)tags API_AVAILABLE(ios(13.0)) API_UNAVAILABLE(watchos, macos, tvos) {
    NSLog(@"reader：%s===%@", __FUNCTION__, tags);
    if (tags.count > 1) {
        [session setAlertMessage:@"More than 1 tag is detected, please remove all tags and try again."];
        NSTimeInterval retryInterval = 500;
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, retryInterval), ^{
            [session restartPolling];
        });
        [session restartPolling];
        return;
    }
    
    // Connect to the found tag and perform NDEF message reading
    id<NFCNDEFTag> tag = tags[0];
    [session connectToTag:tag completionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            [session setAlertMessage:@"Unable to connect to tag."];
            [session invalidateSession];
            return;
        }
        
        [tag queryNDEFStatusWithCompletionHandler:^(NFCNDEFStatus status, NSUInteger capacity, NSError * _Nullable error) {
            
            if (NFCNDEFStatusNotSupported == status) {
                [session setAlertMessage:@"Tag is not NDEF compliant"];
                [session invalidateSession];
            } else if (error != nil) {
                [session setAlertMessage:@"Unable to query NDEF status of tag"];
                [session invalidateSession];
            }
            [tag readNDEFWithCompletionHandler:^(NFCNDEFMessage * _Nullable message, NSError * _Nullable error) {
                NSString *statusMessage = @"";
                if (error != nil || message == nil) {
                    statusMessage = @"Fail to read NDEF from tag";
                } else {
                    statusMessage = @"Found 1 NDEF message";
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.detectedMessages addObject:message];
                        NSLog(@"detectedMessages %@", self.detectedMessages);
                    });
                }
                [session setAlertMessage:statusMessage];
                [session invalidateSession];
            }];
        }];
    }];
}


- (void)fetchDataFromTable:(NSString *)strTableName {
    if ([fmDatabase open]) {
        NSString *strSQLQueryToGetDataFromTable = [NSString stringWithFormat:@"SELECT * FROM SEAT"];
        //FMDatabase 인스턴스의 SQL 쿼리 작업의 결과를 담기 위해 사용
        //executeQuery 메서드 사용해서 쿼리 실행
        FMResultSet *fmResultSet = [fmDatabase executeQuery:strSQLQueryToGetDataFromTable];
        //쿼리 실행시 쿼리의 결과를 가진 FMResultSet 객체 반환됨
        
        //결과 반환 시 컬럼 이름을 키(key)로 이용하여 데이터에 접근 가능!
        arrayForSeatId = [[NSMutableArray alloc] init];
        arrayForSeatNo = [[NSMutableArray alloc] init];
        arrayForWorkPlaceID = [[NSMutableArray alloc] init];
        arrayForNFCUID = [[NSMutableArray alloc] init];
        
        while ([fmResultSet next]) {
            NSString *strName = [fmResultSet stringForColumn:@"seatId"];
            NSString *strName2 = [fmResultSet stringForColumn:@"seatNo"];
            NSString *strName3 = [fmResultSet stringForColumn:@"workPlaceId"];
            NSString *strName4 = [fmResultSet stringForColumn:@"NFCUID"];
            
            //배열에 저장~
            [arrayForSeatId addObject:strName];
            [arrayForSeatNo addObject:strName2];
            [arrayForWorkPlaceID addObject:strName3];
            [arrayForNFCUID addObject:strName4];
            //
            //            [[NSNotificationCenter defaultCenter] postNotificationName:@"loginNoti" object:nil];
            
        }
        [fmDatabase close];
    } else {
        NSLog(@"Unable to open Database");
    }
}

@end
