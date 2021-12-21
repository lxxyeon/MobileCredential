//
//  EmployeeTableViewCell.h
//  MobileCredential
//
//  Created by leeyeon2 on 2021/12/21.
//
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface EmployeeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *userCardView;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *employeeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeTeamLabel;

@property (weak, nonatomic) IBOutlet UIImageView *placeIcon;
@property (weak, nonatomic) IBOutlet UILabel *employeePlaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *employeeSeatLabel;



@property (weak, nonatomic) IBOutlet UIImageView *timerIcon;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIView *HiddenView;
@property (weak, nonatomic) IBOutlet UIImageView *meeting;
@property (weak, nonatomic) IBOutlet UILabel *meetingTitle;
@property (weak, nonatomic) IBOutlet UILabel *meetilngPlace;

@end

NS_ASSUME_NONNULL_END
