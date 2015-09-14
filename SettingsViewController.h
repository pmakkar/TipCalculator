//
//  SettingsViewController.h
//  TipCalculator
//
//  Created by Puneet Makkar on 9/12/15.
//  Copyright (c) 2015 Puneet Makkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerDelegate <NSObject>
@required
- (void)dataFromController:(NSString *)data;
@end

@interface SettingsViewController : UIViewController
@property (nonatomic, weak) id<SettingsViewControllerDelegate> delegate;
@property (nonatomic, retain) NSString *data;

@end
