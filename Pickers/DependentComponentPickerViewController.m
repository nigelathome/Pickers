//
//  DependentComponentPickerViewController.m
//  Pickers
//
//  Created by Nigel Lee on 16/8/8.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "DependentComponentPickerViewController.h"

#define kStateComponent 0
#define kZipComponent   1

@interface DependentComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;
@property (strong, nonatomic) NSDictionary *stateZips;
@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) NSArray *zips;
@end

@implementation DependentComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
