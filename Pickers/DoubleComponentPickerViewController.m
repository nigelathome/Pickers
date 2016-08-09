//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by Nigel Lee on 16/8/8.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define kBreadComponent 1

@interface DoubleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSArray *fillingTypes;
@property (strong, nonatomic) NSArray *breadTypes;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation DoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad", @"Chicken Salad", @"Roast Beef", @"Vegemite"];
    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye", @"Sourdough", @"Seven Grain"];
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

- (IBAction)buttonPressed:(id)sender {
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFillingComponent];
    NSString *filling = self.fillingTypes[fillingRow];
    
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadComponent];
    NSString *bread = self.breadTypes[breadRow];

    NSString *title = [[NSString alloc] initWithFormat:@"Your %@ on %@ bread will be right up.", filling, bread];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank you for your order"
                                                                   message:title
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Great!"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == kFillingComponent) {
        return [self.fillingTypes count];
    } else if (component == kBreadComponent) {
        return [self.breadTypes count];
    } else {
         return -1;
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == kFillingComponent) {
        return self.fillingTypes[row];
    } else if (component == kBreadComponent) {
        return self.breadTypes[row];
    } else {
        return nil ;
    }

}

@end
