//
//  BaseAlertView.h
//  SOSOMap
//
//  Created by Panda on 15/12/21.
//  Copyright © 2015年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseAlertViewDelegate

- (void)basedialogButtonTouchUpInside:(id)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface BaseAlertView : UIView<BaseAlertViewDelegate>

@property (nonatomic, retain) UIView *dialogView;    // Dialog's container view
@property (nonatomic, retain) UIView *containerView; // Container within the dialog (place your ui elements here)

@property (nonatomic, assign) id<BaseAlertViewDelegate> delegate;
@property (nonatomic, retain) NSArray *buttonTitles;
@property (nonatomic, assign) BOOL useMotionEffects;

@property (copy) void (^onButtonTouchUpInside)(BaseAlertView *alertView, int buttonIndex) ;

- (id)init;

- (void)show;
- (void)close;

- (void)basedialogButtonTouchUpInside:(id)sender;
- (void)setOnButtonTouchUpInside:(void (^)(BaseAlertView *alertView, int buttonIndex))onButtonTouchUpInside;

- (void)deviceOrientationDidChange: (NSNotification *)notification;
- (void)dealloc;

@end
