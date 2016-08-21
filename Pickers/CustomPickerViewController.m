//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by Nigel Lee on 16/8/8.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "CustomPickerViewController.h"
#import <AudioToolBox/AudioToolBox.h>
# define numsOfSpinWheel 5

@interface CustomPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (assign, nonatomic) SystemSoundID winSoundID;
@property (assign, nonatomic) SystemSoundID crunchSoundID;
- (IBAction)spin:(id)sender;


@end

@implementation CustomPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // +(UIImage *)imageNamed:(NSString *)name returns the image object associated with the specified filename.
    self.images = @[[UIImage imageNamed:@"seven"], [UIImage imageNamed:@"seven"], [UIImage imageNamed:@"bar"], [UIImage imageNamed:@"cherry"], [UIImage imageNamed:@"crown"], [UIImage imageNamed:@"apple"], [UIImage imageNamed:@"lemon"]];
    self.winLabel.text = @" ";
    
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
- (void)showButton {
    self.button.hidden = NO;
}

- (void)playWinSound {
    if (0 == _winSoundID) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundURL) , &_winSoundID);
    }
    AudioServicesPlaySystemSound(_winSoundID);
    self.winLabel.text = @"WINNER!";
    [self performSelector:@selector(showButton)
               withObject:nil
               afterDelay:1.5];
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    return [self.images count];
}

#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view
{
    UIImage *image = self.images[row];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    return imageView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 64;
}

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
    //    if (isWin) {
    //        self.winLabel.text = @"WINNER!";
    //    } else {
    //        self.winLabel.text = @" ";
    //    }
    
    if (0 == _crunchSoundID) { // load the sound file
        NSString *path = [[NSBundle mainBundle] pathForResource:@"crunch" ofType:@"wav"];
        NSURL *soundURL = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundURL) , &_crunchSoundID);
    }
    AudioServicesPlaySystemSound(_crunchSoundID);
    if (isWin) {
        [self performSelector:@selector(playWinSound)
                   withObject:nil
                   afterDelay:.5];
    } else {
        [self performSelector:@selector(showButton)
                   withObject:nil
                   afterDelay:.5];
    }
    self.button.hidden = YES;
    self.winLabel.text = @" ";
}
@end
