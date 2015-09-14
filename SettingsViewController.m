//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Puneet Makkar on 9/12/15.
//  Copyright (c) 2015 Puneet Makkar. All rights reserved.
//

#import "SettingsViewController.h"
#import "TipViewController.h"

@interface SettingsViewController ()
//@property (nonatomic, retain) NSString *data;
- (IBAction)onTap:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"puneet in settings view controller");
     NSLog(self.data);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {
    
    NSLog(@":%d",self.tipControl.selectedSegmentIndex);
    //[self.delegate dataFromController:self.data];
    NSString *strFromInt = [NSString stringWithFormat:@"%d",self.tipControl.selectedSegmentIndex];
    [self.delegate dataFromController:strFromInt];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
