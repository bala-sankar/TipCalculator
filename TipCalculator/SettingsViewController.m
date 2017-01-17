//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Balachandar Sankar on 1/16/17.
//  Copyright © 2017 Balachandar Sankar. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tip1ValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *tip2ValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *tip3ValueLabel;

@property (weak, nonatomic) IBOutlet UIStepper *tip1Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *tip2Stepper;
@property (weak, nonatomic) IBOutlet UIStepper *tip3Stepper;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self displayValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTip1ValueChanged:(id)sender {
    [self setTip:self.tip1Stepper.value forKey:@"tip1"];
    [self displayValues];
}
- (IBAction)onTip2ValueChanged:(id)sender {
    [self setTip:self.tip2Stepper.value forKey:@"tip2"];
    [self displayValues];
}

- (IBAction)onTip3ValueChanged:(id)sender {
    [self setTip:self.tip3Stepper.value forKey:@"tip3"];
    [self displayValues];
}

-(void) displayValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tip1Value = [defaults integerForKey:@"tip1"];
    NSInteger tip2Value = [defaults integerForKey:@"tip2"];
    NSInteger tip3Value = [defaults integerForKey:@"tip3"];
    
    self.tip1ValueLabel.text = [NSString stringWithFormat:@"%ld%%", tip1Value];
    self.tip2ValueLabel.text = [NSString stringWithFormat:@"%ld%%", tip2Value];
    self.tip3ValueLabel.text = [NSString stringWithFormat:@"%ld%%", tip3Value];
    
    self.tip1Stepper.value = tip1Value;
    self.tip2Stepper.value = tip2Value;
    self.tip3Stepper.value = tip3Value;
}

- (void) setTip:(double)value forKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:value forKey:key];
    [defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
