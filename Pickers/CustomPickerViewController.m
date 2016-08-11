//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by Nigel Lee on 16/8/8.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "CustomPickerViewController.h"
# define numsOfSpinWheel 5
@interface CustomPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
- (IBAction)spin:(id)sender;
@end

@implementation CustomPickerViewController

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

- (IBAction)spin:(id)sender {
    BOOL isWin = NO;
    int numInRow = 1;
    int lastVal = -1;
    for (int i = 0; i < numsOfSpinWheel; ++i) {
        int newValue = arc4random_uniform((uint)[self.images count]);
        if (newValue == lastVal) {
            numInRow++;
        } else {
            numInRow = 1;
        }
        lastVal = newValue;
        
        [self.customPicker selectRow:newValue inComponent:i animated:YES];
        [self.customPicker reloadComponent:i];
        if (numInRow >= 3) {
            isWin = YES;
        }
        
            
    }
    if (isWin) {
        self.winLabel.text = @"WINNER!";
    } else {
        self.winLabel.text = @" ";
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

@end
