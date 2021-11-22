//
//  NFCManager.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/22.
//

#import <Foundation/Foundation.h>
#import <CoreNFC/CoreNFC.h>
#import "FMDatabase.h"
NS_ASSUME_NONNULL_BEGIN

@interface NFCManager : NSObject<NFCNDEFReaderSessionDelegate, NFCTagReaderSessionDelegate>{
    FMDatabase *fmDatabase;
    NSMutableArray *arrayForSeatId;
    NSMutableArray *arrayForSeatNo;
    NSMutableArray *arrayForWorkPlaceID;
    NSMutableArray *arrayForNFCUID;
}

@property (nonatomic, strong) NFCNDEFReaderSession *ndefSession;
@property (nonatomic, strong) NFCTagReaderSession *tagReaderSession;
@property (nonatomic, strong) NSMutableArray<NFCNDEFMessage *> *detectedMessages;


/**
 *  Singleton Pattern
 *
 *  @return 클래스 인스턴스
 */
+(instancetype)shared;

- (void)fetchDataFromTable:(NSString *)strTableName;

@end

NS_ASSUME_NONNULL_END
