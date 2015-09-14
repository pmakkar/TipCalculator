//
//  TipViewController.m
//  TipCalculator
//
//  Created by Puneet Makkar on 9/12/15.
//  Copyright (c) 2015 Puneet Makkar. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController () <SettingsViewControllerDelegate>
{
    
}
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
-(void)updateValues;
- (IBAction)onTap:(id)sender;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self addNavigationBarButton];
    // Do any additional setup after loading the view from its nib.
}

-(void)addNavigationBarButton{
    UIBarButtonItem *myNavBtn = [[UIBarButtonItem alloc] initWithTitle:
                                 @"Settings" style:UIBarButtonItemStyleBordered target:
                                 self action:@selector(pushNewView:)];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [self.navigationItem setRightBarButtonItem:myNavBtn];
    
    
    
    // create a navigation push button that is initially hidden
    /*navButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [navButton setFrame:CGRectMake(60, 50, 200, 40)];
    [navButton setTitle:@"Push Navigation" forState:UIControlStateNormal];
    [navButton addTarget:self action:@selector(pushNewView:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navButton];
    [navButton setHidden:YES];*/
}

-(IBAction)pushNewView:(id)sender{
    SettingsViewController *tempVC =[[SettingsViewController alloc]
                                 initWithNibName:@"SettingsViewController" bundle:nil];
    tempVC.data = @"jai ho";
    tempVC.delegate = self;
    [self.navigationController pushViewController:tempVC animated:YES];
}

- (void)dataFromController:(NSString *)data
{
    
    NSLog(@"This is it: %@", data);
    //NSString *a = @"123abc";
    NSInteger value = [data integerValue];
    
    [self.tipControl setSelectedSegmentIndex:value];
    
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15),@(0.2)];
    float tipAmout = billAmount * [tipValues[value] floatValue];
    float totalAmount = billAmount + tipAmout;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmout];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
    
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


- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15),@(0.2)];
    float tipAmout = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmout;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmout];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

- (IBAction)onTap:(id)sender {
    NSLog(@"puneet keyboard clicked");
    [self.view endEditing:YES];
    [self updateValues];
}

@end
