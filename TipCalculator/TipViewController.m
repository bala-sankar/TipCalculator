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
    self.title = @"Tip Calculator";
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

- (void)updateValues {
    // Biil Value
    float billAmount = [self.billTextField.text floatValue];
    
    // Calculate values
    NSArray *tipPercValues = @[@(0.15), @(0.20), @(0.25)];
    float tipAmount = [tipPercValues[self.tipPercSegment.selectedSegmentIndex] floatValue] * billAmount;
    
    float totalAmount = billAmount + tipAmount;
    
    // Display
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
