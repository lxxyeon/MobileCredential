//
//  NSData+Conversion.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/29.
//

#import "NSData+Conversion.h"

@implementation NSData_Conversion

- (NSString *)leftTimeString {
    NSString *leftTimeString;
    //출근시간
    NSString *startDateString = @"08:00";
    NSDateFormatter *startFormatter = [[NSDateFormatter alloc] init];
    startFormatter.dateFormat = @"HH:mm";
    NSTimeZone *timeZone;
    startFormatter.timeZone = [NSTimeZone timeZoneWithName: @"UTC"];
    
    //현재시간
    NSDate *realTime = [NSDate date];
    NSTimeZone *krTimeZone =[NSTimeZone timeZoneWithName:@"ko_KR"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setTimeZone:krTimeZone];
    NSString *dateString = [dateFormatter stringFromDate:realTime];

    
    //남은시간
//    NSDate *leftTime;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger calendarUnit = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDate *startTime = [startFormatter dateFromString: startDateString];
    NSDateComponents *dateComp = [calendar components: calendarUnit
                                    fromDate: startTime
                                      toDate: realTime
                                     options:0];
//    NSInteger day = dateComp.day;
    NSInteger hour = dateComp.hour;
    NSInteger min = dateComp.minute;
    NSInteger sec = dateComp.second;
    
    leftTimeString = [NSString stringWithFormat: @"%dh %dm %ds", hour, min, sec];
    
    
    return  leftTimeString;
}

- (NSString *)realTimeString{
    NSString *todayString;
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormat setDateFormat:@"HH:mm"];
    [dateFormat setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"] autorelease]];
   
    todayString = [dateFormat stringFromDate: today];
    
    return [NSString stringWithString: todayString];
}

#pragma mark - String Conversion
- (NSString *)hexadecimalString {
    /* Returns hexadecimal string of NSData. Empty string if data is empty.   */
    const unsigned char *dataBuffer = (const unsigned char *)[self bytes];
    if (!dataBuffer)
        return [NSString string];
    NSUInteger          dataLength  = [self length];
    NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];

    for (int i = 0; i < dataLength; ++i)
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];

    return [NSString stringWithString:hexString];
}

@end
