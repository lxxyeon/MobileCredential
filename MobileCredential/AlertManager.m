//
//  AlertManager.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/11/24.
//

#import "AlertManager.h"
#import "WindowManager.h"

@implementation AlertManager

+(instancetype)shared{
    static AlertManager *shared = nil;
    
    //dispatch_once_t : 앱이 실행되고 종료될 때까지 단 1회만 실행한다는 것을 보장하며 완벽히 sychronous하게 동작
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[AlertManager alloc] init];
    });

    return shared;
}

-(void)alertSignInMessage: (NSString*)str{
    //1.Alert - ID, Password 다 입력했는지 Check!
    UIAlertController * alert =   [UIAlertController
                                   alertControllerWithTitle:@"ERROR"
                                   message:str
                                   preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction: ok];
    //최상위 VC에 띄움
    UIViewController *topVC = [WindowManager topVisibleViewController];
    [topVC presentViewController: alert animated:YES completion:nil];
}

@end
