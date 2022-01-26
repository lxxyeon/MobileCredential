//
//  HistoryViewController.m
//  MobileCredential
//
//  Created by leeyeon2 on 2021/12/19.
//

#import "HistoryViewController.h"
//#import "UIView+HMPConstraint.h"

@interface HistoryViewController (){

}


@end

@implementation HistoryViewController
@end
//
//
//@interface HistoryViewController (){
//    HistoryTimelineView *timeline;
//    void * _KVOContext;
//}
//
//@property (strong, nonatomic) IBOutlet FSCalendar *calendar;
//@property (weak, nonatomic) IBOutlet UIView *userTimeline;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarHeight;
//@property (strong, nonatomic) UIPanGestureRecognizer *scopeGesture;
//
//@property (weak, nonatomic) IBOutlet UISwitch *animationSwitch;
////@property (nonatomic, assign) bool isTest;
//@end
//
//@implementation HistoryViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
////    NSLog(@"여기");
//    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"HistoryTimelineView" owner:nil options:nil];
//    timeline = [arr firstObject];
//    [_userTimeline addSubview: timeline];
//    timeline.historyTableView.translatesAutoresizingMaskIntoConstraints = NO;
//    [timeline.historyTableView.bottomAnchor constraintEqualToAnchor: timeline.bottomAnchor].active = YES;
//    [timeline didMoveToSuperview];
//   
//    self.navigationItem.title = @"History";
//    
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.calendar action:@selector(handleScopeGesture:)];
//    panGesture.delegate = self;
//    panGesture.minimumNumberOfTouches = 1;
//    panGesture.maximumNumberOfTouches = 2;
//    [self.view addGestureRecognizer:panGesture];
//    self.scopeGesture = panGesture;
//    // While the scope gesture begin, the pan gesture of tableView should cancel.
//
//    [self.calendar addObserver:self forKeyPath:@"scope" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:_KVOContext];
//    
//    self.calendar.placeholderType = FSCalendarPlaceholderTypeNone;
//    self.calendar.scope = FSCalendarScopeWeek;
////
//    [self.calendar selectDate:[NSDate date] scrollToDate:YES];
////
//    // For UITest
//    self.calendar.accessibilityIdentifier = @"calendar";
//
//}
//
//- (void)dealloc
//{
//    [self.calendar removeObserver:self forKeyPath:@"scope" context:_KVOContext];
//    NSLog(@"%s",__FUNCTION__);
//}
//
//#pragma mark - <UIGestureRecognizerDelegate>
//
//// Whether scope gesture should begin
////- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
////{
////    BOOL shouldBegin = self.userTimeline.contentOffset.y <= -self.userTimeline.contentInset.top;
////    if (shouldBegin) {
////        CGPoint velocity = [self.scopeGesture velocityInView:self.view];
////        switch (self.calendar.scope) {
////            case FSCalendarScopeMonth:
////                return velocity.y < 0;
////            case FSCalendarScopeWeek:
////                return velocity.y > 0;
////        }
////    }
////    return shouldBegin;
////}
//
//- (IBAction)toggleClicked:(id)sender
//{
//    if (self.calendar.scope == FSCalendarScopeMonth) {
//        [self.calendar setScope:FSCalendarScopeWeek animated:_animationSwitch.on];
//    } else {
//        [self.calendar setScope:FSCalendarScopeMonth animated:_animationSwitch.on];
//    }
//}
//
//- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
//{
//    self.calendarHeight.constant = CGRectGetHeight(bounds);
//    // Do other updates here
//    [self.view layoutIfNeeded];
//}
//
//- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition{
//    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat: @"YYYY-MM-dd"];
//    NSLog(@"%@",[dateFormatter stringFromDate:date]);
//
//}
//
////- (void)viewDidAppear:(BOOL)animated{
////    [super viewDidAppear:animated];
////    [self.navigationController setNavigationBarHidden:NO animated:animated];
//////    [self.navigationController setNavigationBarHidden:YES animated:NO];
////}
////- (void)viewWillAppear:(BOOL)animated{
////    [super viewWillAppear:animated];
////    [self.navigationController setNavigationBarHidden:NO animated:animated];
////}
//@end
