//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by Nigel Lee on 16/8/8.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *characterNames;

- (IBAction)buttonPressed:(id)sender;
@end

@implementation SingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca",@"Artoo", @"Threepio", @"Lando"];
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
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", selected];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:@"Thanks for choosing."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"You're welcome."
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
    
}

// this method comes from UIPickerViewDataSource protocol
#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.characterNames[row];
}




























@end
