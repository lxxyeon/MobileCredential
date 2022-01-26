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

#import "UIView+HMPConstraint.h"

@implementation UIView (HMPConstraint)

-(void)hmpFillParent{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self hmpFillParentWidth];
    [self hmpFillParentHeight];
}

-(void)hmpFillParentWidth{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeWidth
                                                              multiplier:1.0
                                                                constant:0]];
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                                constant:0.0]];
}


-(void)hmpFillParentHeight{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight   relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeHeight     multiplier:1.f constant:0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY   relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY     multiplier:1.f constant:0]];
}

-(void)hmpAlignToRightOf:(UIView*)to {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeTrailing multiplier:1.f constant:0]];
}
-(void)hmpAlignToLeftOf:(UIView*)to {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeLeading multiplier:1.f constant:0]];
}

-(void)hmpAlignToRightOf:(UIView*)to margin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeTrailing multiplier:1.f constant:margin]];
}
-(void)hmpAlignToLeftOf:(UIView*)to margin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeLeading multiplier:1.f constant:margin]];
}


-(void)hmpCenterHoriOf:(UIView*)to{
    [self hmpCenterHoriOf:to margin:1.f];
}
-(void)hmpCenterVertiOf:(UIView*)to {
    [self hmpCenterVertiOf:to margin:1.f];
}
-(void)hmpCenterHoriOf:(UIView*)to margin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX        relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeCenterX   multiplier:1.f constant:margin]];
}
-(void)hmpCenterVertiOf:(UIView*)to margin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY        relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeCenterY   multiplier:1.f constant:margin]];
}

-(void)hmpAlignToTopOf:(UIView*)to{
    [self hmpAlignToTopOf:to margin:0.f];
}
-(void)hmpAlignToBottomOf:(UIView*)to{
    [self hmpAlignToBottomOf:to margin:0.f];
}

-(void)hmpAlignToTopOf:(UIView*)to margin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeTop multiplier:1.f constant:margin]];
}

-(void)hmpAlignToBottomOf:(UIView*)to margin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeBottom multiplier:1.f constant:margin]];
}


-(void)hmpTopSpaceOf:(UIView*)to margin:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:to attribute:NSLayoutAttributeBottom
                                                              multiplier:1.f
                                                                constant:c]];
}

-(void)hmpBottomSpaceOf:(UIView*)to margin:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom     relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeTop   multiplier:1.f constant:c]];
}


-(void)hmpLeadingParent:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading   relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeLeading   multiplier:1.f constant:c]];
}

-(void)hmpTrailingParent:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing   relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTrailing  multiplier:1.f constant:c]];
}

-(void)hmpTopSpaceParent:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop        relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeTop   multiplier:1.f constant:c]];
}

-(void)hmpBottomSpaceParent:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom     relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeBottom   multiplier:1.f constant:c]];
}



-(void)hmpLeadingMargin:(CGFloat)c to:(UIView*)v{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeading   relatedBy:NSLayoutRelationEqual toItem:v attribute:NSLayoutAttributeLeading   multiplier:1.f constant:c]];
}

-(void)hmpTrailingMargin:(CGFloat)c to:(UIView*)v{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailing   relatedBy:NSLayoutRelationEqual toItem:v attribute:NSLayoutAttributeTrailing  multiplier:1.f constant:c]];
}

-(void)hmpTopSpaceMargin:(CGFloat)c to:(UIView*)v{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTopMargin
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:v
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.f
                                                                constant:c]];
}

-(void)hmpBottomSpaceMargin:(CGFloat)c to:(UIView*)v{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottomMargin     relatedBy:NSLayoutRelationEqual toItem:v attribute:NSLayoutAttributeTop   multiplier:1.f constant:c]];
}

-(void)hmpEqualHeight:(UIView*)to{
    [self hmpEqualWidth:to multiplier:1.f];
}

-(void)hmpEqualWidth:(UIView*)to{
    [self hmpEqualWidth:to multiplier:1.f];
}

-(void)hmpEqualHeight:(UIView*)to multiplier:(CGFloat)m{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight   relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeHeight     multiplier:m constant:0]];
}

-(void)hmpEqualWidth:(UIView*)to multiplier:(CGFloat)m{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth   relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeWidth     multiplier:m constant:0]];
}

-(void)hmpFixWidth:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth      relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth     multiplier:1.f constant:c]];
}

-(void)hmpFixWidthMultiplier:(CGFloat)m constant:(CGFloat)c {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth      relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth     multiplier:m constant:c]];
}

-(NSLayoutConstraint *)hmpFixHeiht:(CGFloat)c{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:self
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeHeight
                                                                  multiplier:1.f
                                                                    constant:c];
    [self.superview addConstraint:constraint];
    return constraint;
}

-(void)hmpFixHeihtMultiplier:(CGFloat)m constant:(CGFloat)c {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight      relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight     multiplier:m constant:c]];
}

-(void)hmpAsceptRatioHeightFromWidthMultiplier:(CGFloat)m constant:(CGFloat)c {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight      relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth     multiplier:m constant:c]];
}

-(void)hmpAsceptRatioWidthFromHeightMultiplier:(CGFloat)m constant:(CGFloat)c {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight      relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth     multiplier:m constant:c]];
}

-(void)hmpSetWidthFromHeight:(CGFloat)m {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:m constant:0]];
}

-(void)hmpSetHeightFromWidth:(CGFloat)m {
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:m constant:0]];
}

-(void)hmpBelowTo:(UIView*)to margin:(CGFloat)margin {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeBottom multiplier:1.f constant:margin]];
}

-(void)hmpAboveTo:(UIView*)to margin:(CGFloat)margin {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:to attribute:NSLayoutAttributeTop multiplier:1.f constant:margin]];
}

-(void)hmpCenterInHori{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX        relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX   multiplier:1.f constant:0]];
}
-(void)hmpCenterInVertical{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY        relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY   multiplier:1.f constant:0]];
}

-(void)hmpCenterInHoriMargin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX        relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX   multiplier:1.f constant:margin]];
}
-(void)hmpCenterInVerticalMagin:(CGFloat)margin{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY        relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY   multiplier:1.f constant:margin]];
}

@end
