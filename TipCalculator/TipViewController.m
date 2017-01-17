//
//  ViewController.m
//  TipCalculator
//
//  Created by Balachandar Sankar on 1/16/17.
//  Copyright © 2017 Balachandar Sankar. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercSegment;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tippr";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:5 forKey:@"tip1"];
    [defaults setInteger:10 forKey:@"tip2"];
    [defaults setInteger:15 forKey:@"tip3"];
    [defaults synchronize];
    [self displayTipPerc];
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onTipPercChanged:(id)sender {
    [self updateValues];
}

- (void) displayTipPerc {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tip1Value = [defaults integerForKey:@"tip1"];
    NSInteger tip2Value = [defaults integerForKey:@"tip2"];
    NSInteger tip3Value = [defaults integerForKey:@"tip3"];
    
    NSString *tip1 =  [NSString stringWithFormat:@"%ld%%", tip1Value];
    NSString *tip2 =  [NSString stringWithFormat:@"%ld%%", tip2Value];
    NSString *tip3 =  [NSString stringWithFormat:@"%ld%%", tip3Value];
    
    [self.tipPercSegment setTitle:tip1 forSegmentAtIndex:0];
    [self.tipPercSegment setTitle:tip2 forSegmentAtIndex:1];
    [self.tipPercSegment setTitle:tip3 forSegmentAtIndex:2];
}

- (void)updateValues {
    // Biil Value
    float billAmount = [self.billTextField.text floatValue];
    
    // Calculate values
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tip1Value = [defaults integerForKey:@"tip1"];
    int tip2Value = [defaults integerForKey:@"tip2"];
    int tip3Value = [defaults integerForKey:@"tip3"];
    
    double tip1 = tip1Value/100.0;
    double tip2 = tip2Value/100.0;
    double tip3 = tip3Value/100.0;
    
    NSArray *tipPercValues = @[@(tip1), @(tip2), @(tip3)];
    float tipAmount = [tipPercValues[self.tipPercSegment.selectedSegmentIndex] floatValue] * billAmount;
    
    float totalAmount = billAmount + tipAmount;
    
    // Display
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    [self displayTipPerc];
    [self updateValues];
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
