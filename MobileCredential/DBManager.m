//
//  DBManager.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/19.
//


/**
 *  DB 관리
 */
@implementation DBManager{
    NSMutableArray *arrayForName;
}
@synthesize fmDatabase;

+(instancetype)shared{
    static DBManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[DBManager alloc] init];
    });
    return shared;
}

-(void)insertDataToDBTable:(NSString *)strTableName dict:(NSDictionary*) dict{
    if ([fmDatabase open]) {
        NSMutableArray* cols = [[NSMutableArray alloc] init];
        NSMutableArray* vals = [[NSMutableArray alloc] init];
        
        for (id key in dict) {
            [vals addObject:key];
            [cols addObject:[dict objectForKey:key]];
        }
        NSMutableArray* newCols = [[NSMutableArray alloc] init];
        NSMutableArray* newVals = [[NSMutableArray alloc] init];
        
        for (int i = 0; i<[cols count]; i++) {
            [newCols addObject:[NSString stringWithFormat:@"'%@'", [cols objectAtIndex:i]]];
            [newVals addObject:[NSString stringWithFormat:@"'%@'", [vals objectAtIndex:i]]];
        }
        NSString* sql = [NSString stringWithFormat:@"insert into '%@' (%@) values (%@)", strTableName, [newCols componentsJoinedByString:@", "], [newVals componentsJoinedByString:@", "]];
        NSLog(@"%@", sql);
        if(![fmDatabase executeUpdate:sql]) {
            NSLog(@"Error in adding data to Table in Database");
        } else {
            NSLog(@"Success in adding data to Table in Database");
        }
        [fmDatabase close];
    } else {
        NSLog(@"Unable to open Database");
    }
}

-(void)openDB:(NSString *)strSQLiteDatabaseName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dbFilePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:DB_NAME]];
    //    NSLog(@"Database Filepath Delgate = %@", dbFilePath);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //    BOOL dbFileExists = [fileManager fileExistsAtPath:dbFilePath];
    
    NSString *bundledDbPath = [[NSBundle mainBundle] pathForResource:@"MLUP_DB" ofType:@"db"];
    [fileManager copyItemAtPath:bundledDbPath toPath:dbFilePath error:nil];
    //데이터베이스 연결
    fmDatabase= [FMDatabase databaseWithPath:dbFilePath];
    [fmDatabase setShouldCacheStatements:NO];
}


- (void)fetchDataFromTable:(NSString *)strTableName {
    if ([fmDatabase open]) {
        NSString *strSQLQueryToGetDataFromTable = [NSString stringWithFormat:@"SELECT * FROM '%@'", strTableName];
        FMResultSet *fmResultSet = [fmDatabase executeQuery:strSQLQueryToGetDataFromTable];
        while ([fmResultSet next]) {
            //            NSString *strName = [fmResultSet stringForColumn:@"name"];
        }
        [fmDatabase close];
    } else {
    }
}
@end

