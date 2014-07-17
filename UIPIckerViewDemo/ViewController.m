//
//  ViewController.m
//  UIPIckerViewDemo
//
//  Created by James on 2014/7/17.
//  Copyright (c) 2014年 james. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIPickerView *pickerView;
    NSArray *dataAry;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	dataAry = [[NSArray alloc] initWithObjects:@"test1",@"test2",@"test3",@"test4",@"test5", nil] ;
    
    pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = true;
    _myTF.inputView = pickerView;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideThePicker)];
    tapGesture.delegate = self;
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
    
}

-(IBAction)hideThePicker {
    NSLog(@"hideAllKeyboards");
    pickerView.frame = CGRectMake(0, 480, 320, 260);
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger) row forComponent:(NSInteger)component
{
    
    
    
    return dataAry[row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [dataAry count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"dataAry selected:%ld", row);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
