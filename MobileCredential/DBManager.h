//
//  DBManager.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/19.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  Database Manager
 */
@interface DBManager : NSObject
@property (nonatomic,strong) FMDatabase *fmDatabase;;
/**
 *  Singleton Pattern
 *
 *  @return 클래스 인스턴스
 */
+(instancetype)shared;
/**
 *  Open DB
 *
 *  @param strSQLiteDatabaseName DB이름
 */
-(void)openDB:(NSString *)strSQLiteDatabaseName;
/**
 *  INSERT 문
 *
 *  @param strTableName table 이름
 *  @param dict insert할 data
 */
-(void)insertDataToDBTable:(NSString *)strTableName dict:(NSDictionary*) dict;
/**
 *  SELECT 문
 *
 *  @param strTableName table 이름
 */
- (void)fetchDataFromTable:(NSString *)strTableName;
@end

NS_ASSUME_NONNULL_END
