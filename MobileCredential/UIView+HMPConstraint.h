/**
* Copyright (C) Hanwha Systems Ltd., 2015. All rights reserved.
*
* This software is covered by the license agreement between
* the end user and Hanwha Systems Ltd., and may be
* used and copied only in accordance with the terms of the
* said agreement.
*
* Hanwha Systems Ltd., assumes no responsibility or
* liability for any errors or inaccuracies in this software,
* or any consequential, incidental or indirect damage arising
* out of the use of the software.
*/

@interface UIView (HMPConstraint)

-(void)hmpFillParent;
-(void)hmpFillParentWidth;
-(void)hmpFillParentHeight;

-(void)hmpAlignToRightOf:(UIView*)to;
-(void)hmpAlignToLeftOf:(UIView*)to;

-(void)hmpAlignToRightOf:(UIView*)to margin:(CGFloat)margin;
-(void)hmpAlignToLeftOf:(UIView*)to margin:(CGFloat)margin;

-(void)hmpCenterHoriOf:(UIView*)to;
-(void)hmpCenterVertiOf:(UIView*)to;
-(void)hmpCenterHoriOf:(UIView*)to margin:(CGFloat)margin;
-(void)hmpCenterVertiOf:(UIView*)to margin:(CGFloat)margin;

-(void)hmpAlignToTopOf:(UIView*)to;
-(void)hmpAlignToBottomOf:(UIView*)to;

-(void)hmpAlignToTopOf:(UIView*)to margin:(CGFloat)margin;
-(void)hmpAlignToBottomOf:(UIView*)to margin:(CGFloat)margin;

-(void)hmpTopSpaceOf:(UIView*)to margin:(CGFloat)c;
-(void)hmpBottomSpaceOf:(UIView*)to margin:(CGFloat)c;

-(void)hmpLeadingParent:(CGFloat)c;
-(void)hmpTrailingParent:(CGFloat)c;

-(void)hmpTopSpaceParent:(CGFloat)c;
-(void)hmpBottomSpaceParent:(CGFloat)c;

-(void)hmpLeadingMargin:(CGFloat)c to:(UIView*)v;
-(void)hmpTrailingMargin:(CGFloat)c to:(UIView*)v;
-(void)hmpTopSpaceMargin:(CGFloat)c to:(UIView*)v;
-(void)hmpBottomSpaceMargin:(CGFloat)c to:(UIView*)v;

-(void)hmpEqualHeight:(UIView*)to;
-(void)hmpEqualWidth:(UIView*)to;

-(void)hmpEqualHeight:(UIView*)to multiplier:(CGFloat)m;
-(void)hmpEqualWidth:(UIView*)to multiplier:(CGFloat)m;

-(void)hmpFixWidth:(CGFloat)c;
-(void)hmpFixWidthMultiplier:(CGFloat)m constant:(CGFloat)c;

-(NSLayoutConstraint *)hmpFixHeiht:(CGFloat)c;
-(void)hmpFixHeihtMultiplier:(CGFloat)m constant:(CGFloat)c;

-(void)hmpAsceptRatioHeightFromWidthMultiplier:(CGFloat)m constant:(CGFloat)c;
-(void)hmpAsceptRatioWidthFromHeightMultiplier:(CGFloat)m constant:(CGFloat)c;

-(void)hmpSetWidthFromHeight:(CGFloat)m;
-(void)hmpSetHeightFromWidth:(CGFloat)m;

-(void)hmpBelowTo:(UIView*)to margin:(CGFloat)margin;
-(void)hmpAboveTo:(UIView*)to margin:(CGFloat)margin;

-(void)hmpCenterInHori;
-(void)hmpCenterInVertical;

-(void)hmpCenterInHoriMargin:(CGFloat)margin;
-(void)hmpCenterInVerticalMagin:(CGFloat)margin;

@end
