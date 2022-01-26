//
//  EmployeeViewController.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/12/21.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController (){
}
@end

@implementation EmployeeViewController
@end

//
//@interface EmployeeViewController ()<LUNSegmentedControlDataSource, LUNSegmentedControlDelegate, CarbonTabSwipeNavigationDelegate>{
//    UserModel *loginDt;
//    FMDatabase *fmDatabase;
//    NSArray *items;
//    CarbonTabSwipeNavigation *carbonTabSwipeNavigation;
//}
//
//@property (weak, nonatomic) IBOutlet UITableView *employeeTable;
//@property (weak, nonatomic) IBOutlet LUNSegmentedControl *segmentedControl;
//@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
//
////@property (weak, nonatomic) IBOutlet LUNSegmentedControl *segmentedControl;
//
//
//
//@end
//@implementation EmployeeViewController
//
//static id ObjectOrNull(id object)
//{
//  return object ?: [NSNull null];
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.title = @"CarbonKit";
//    items = @[
//        @"전체",
//        @"거점",
//        @"재택",
//        @"회의",
//        @"퇴근"
//
//    ];
//    //
//    carbonTabSwipeNavigation = [[CarbonTabSwipeNavigation alloc] initWithItems:items delegate:self];
//
//    [carbonTabSwipeNavigation insertIntoRootViewController:self];
//
//    [self style];
//
//
//    [self uiSetting];
//    _employeeTable.dataSource = self;
//    _employeeTable.delegate = self;
//    loginDt = [UserDataManager sharedInstance].userVO;
//    [self fetchDataFromTable:DB_TABLE_USER];
//    self.segmentedControl.transitionStyle = LUNSegmentedControlTransitionStyleFade;
//
////    self.userCardView.backgroundColor = [UIColor lightGrayColor];
////    self.employeeTable.backgroundColor = [UIColor lightGrayColor];
//
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (void)style {
//    UIColor *color = [UIColor colorWithRed: 254.0 / 255 green: 100.0 / 255 blue:0.0 / 255 alpha:1];
//
//
//
//
//
//    carbonTabSwipeNavigation.toolbar.translucent = NO;
//    [carbonTabSwipeNavigation setIndicatorColor:color];
//    [carbonTabSwipeNavigation setTabExtraWidth: 0];
//    [carbonTabSwipeNavigation.carbonSegmentedControl setWidth:80 forSegmentAtIndex:0];
//    [carbonTabSwipeNavigation.carbonSegmentedControl setWidth:80 forSegmentAtIndex:1];
//    [carbonTabSwipeNavigation.carbonSegmentedControl setWidth:80 forSegmentAtIndex:2];
//    [carbonTabSwipeNavigation.carbonSegmentedControl setWidth:80 forSegmentAtIndex:3];
//    [carbonTabSwipeNavigation.carbonSegmentedControl setWidth:80 forSegmentAtIndex:4];
//
//    // Custimize segmented control
//    [carbonTabSwipeNavigation setNormalColor:[color colorWithAlphaComponent:0.6]
//                                        font:[UIFont boldSystemFontOfSize:15]];
//    [carbonTabSwipeNavigation setSelectedColor:color font:[UIFont boldSystemFontOfSize:16]];
//}
//
//#pragma mark - CarbonTabSwipeNavigation Delegate
//// required
//- (nonnull UIViewController *)carbonTabSwipeNavigation:
//(nonnull CarbonTabSwipeNavigation *)carbontTabSwipeNavigation
//                                 viewControllerAtIndex:(NSUInteger)index {
//    switch (index) {
//        case 0:
//            return [self.storyboard instantiateViewControllerWithIdentifier:@"Emview"];
//
//        case 1:
//            return [self.storyboard instantiateViewControllerWithIdentifier:@"Emview"];
//
//        default:
//            return [self.storyboard instantiateViewControllerWithIdentifier:@"Emview"];
//    }
//}
//
//// optional
//- (void)carbonTabSwipeNavigation:(CarbonTabSwipeNavigation *)carbonTabSwipeNavigation willMoveAtIndex:(NSUInteger)index {
//    switch (index) {
//
//        default:
//            self.title = items[index];
//            break;
//    }
//}
//
//- (void)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation
//                  didMoveAtIndex:(NSUInteger)index {
//    NSLog(@"Did move at index: %ld", index);
//
//}
//
//- (UIBarPosition)barPositionForCarbonTabSwipeNavigation:
//(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation {
//    return UIBarPositionTop; // default UIBarPositionTop
//}
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//}
//
//- (void)viewWillAppear:(BOOL)animated{
//    //    NSLog(@"%ld",(long)currentTableViewNumber);
//}
//
//
////- (void)segmentedControl:(LUNSegmentedControl *)segmentedControl didChangeStateFromStateAtIndex:(NSInteger)fromIndex toStateAtIndex:(NSInteger)toIndex{
////    if(toIndex == 0){
////
////        currentTableViewNumber = 0;
////        [self.employeeTable setSeparatorColor: [UIColor colorWithRed:160 / 255.0 green:223 / 255.0 blue:56 / 255.0 alpha:1.0]];
////        [self.employeeTable reloadData];
////
////    }else if(toIndex == 1){
////
////        currentTableViewNumber = 1;
////        [self.employeeTable setSeparatorColor: [UIColor colorWithRed:51 / 255.0 green:199 / 255.0 blue:244 / 255.0 alpha:1.0]];
////        [self.employeeTable reloadData];
////
////    }else if(toIndex == 2){
////
////        currentTableViewNumber = 2;
////        [self.employeeTable setSeparatorColor: [UIColor colorWithRed:233 / 255.0 green:0 / 255.0 blue:147 / 255.0 alpha:1.0]];
////        [self.employeeTable reloadData];
////
////    }
////}
//
//- (NSInteger)numberOfStatesInSegmentedControl:(LUNSegmentedControl *)segmentedControl {
//    return 3;
//}
//
//- (NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForStateAtIndex:(NSInteger)index {
//    NSAttributedString *segTitle;
//
//    if (index==0) {
//        segTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"전체"] attributes:@{NSFontAttributeName : [UIFont fontWithName:@"NanumBarunGothic" size:20]}];
//    }else if (index==1) {
//        segTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"회의"] attributes:@{NSFontAttributeName : [UIFont fontWithName:@"NanumBarunGothic" size:20]}];
//    }else{
//        segTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"퇴근"] attributes:@{NSFontAttributeName : [UIFont fontWithName:@"NanumBarunGothic" size:20]}];
//    }
//    return segTitle;
//}
//
//
////
////- (NSAttributedString *)segmentedControl:(LUNSegmentedControl *)segmentedControl attributedTitleForSelectedStateAtIndex:(NSInteger)index {
////    NSAttributedString *segTitleForSelected;
////
////    NSShadow *shadow = [NSShadow new];
////    [shadow setShadowColor: [UIColor colorWithWhite:0.0f alpha:0.1f]];
////    [shadow setShadowOffset: CGSizeMake(1.5f, 1.5f)];
////
////    if (index==0) {
////        segTitleForSelected = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"전체"] attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:23], NSShadowAttributeName:shadow
////        }];
////
////    }else if (index==1) {
////        segTitleForSelected = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"회의"] attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:23], NSShadowAttributeName:shadow
////        }];
////    }else if (index==2) {
////        segTitleForSelected = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"퇴근"] attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:23], NSShadowAttributeName:shadow
////        }];
////    }
////    currentTableViewNumber = segmentedControl.currentState;
////    return segTitleForSelected;
////}
//
//
//
//
//- (NSArray<UIColor *> *)segmentedControl:(LUNSegmentedControl *)segmentedControl gradientColorsForStateAtIndex:(NSInteger)index {
//    switch (index) {
//        case 0:
//            return @[[UIColor colorWithRed:160 / 255.0 green:223 / 255.0 blue:56 / 255.0 alpha:1.0], [UIColor colorWithRed:177 / 255.0 green:255 / 255.0 blue:0 / 255.0 alpha:1.0]];
//
//            break;
//
//        case 1:
//            return @[[UIColor colorWithRed:78 / 255.0 green:252 / 255.0 blue:208 / 255.0 alpha:1.0], [UIColor colorWithRed:51 / 255.0 green:199 / 255.0 blue:244 / 255.0 alpha:1.0]];
//            break;
//
//        case 2:
//            return @[[UIColor colorWithRed:178 / 255.0 green:0 / 255.0 blue:235 / 255.0 alpha:1.0], [UIColor colorWithRed:233 / 255.0 green:0 / 255.0 blue:147 / 255.0 alpha:1.0]];
//            break;
//
//        default:
//            break;
//    }
//    return nil;
//}
//
//
//
//- (void)fetchDataFromTable:(NSString *)strTableName {
//    if ([fmDatabase open]) {
//        NSString *strSQLQueryToGetDataFromTable = [NSString stringWithFormat:@"SELECT * FROM '%@'", strTableName];
//        FMResultSet *fmResultSet = [fmDatabase executeQuery:strSQLQueryToGetDataFromTable];
//        while ([fmResultSet next]) {
//            //            NSString *strName = [fmResultSet stringForColumn:@"name"];
//        }
//        [fmDatabase close];
//    } else {
//    }
//}
//
//- (void) uiSetting{
//    self.navigationItem.title = @"아키텍트팀";
//
////    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:255/255.0
////                                                                           green:132/255.0
////                                                                            blue:38/255.0
////                                                                           alpha:1];
//    self.navigationController.navigationBar.topItem.title = @" ";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
//    [self.navigationController.navigationBar setValue:@(YES) forKeyPath:@"hidesShadow"];
//
//
//}
//@end
