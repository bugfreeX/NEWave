//
//  ViewController.m
//  NEWave
//
//  Created by Nslson on 2017/2/15.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "ViewController.h"
#import "NEWave.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NEWave *circle1View;
@property (weak, nonatomic) IBOutlet NEWave *circle2View;
@property (weak, nonatomic) IBOutlet NEWave *circle3View;
@property (weak, nonatomic) IBOutlet NEWave *rectangularView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#pragma mark circle1View
    self.circle1View.layer.cornerRadius = CGRectGetHeight(self.circle1View.bounds) / 2;
    self.circle1View.realWaveColor = [UIColor colorWithRed:0.035 green:0.678 blue:0.988 alpha:1.00];
    self.circle1View.maskWaveColor = [[UIColor colorWithRed:0.035 green:0.678 blue:0.988 alpha:1.00] colorWithAlphaComponent:0.4];
    self.circle1View.progress = 0.5;
    self.circle1View.waveSpeed = 10;
    self.circle1View.waveFrequency = 0.5;
    [self.circle1View startAnimation];
    
#pragma mark circle2View
    self.circle2View.layer.cornerRadius = CGRectGetHeight(self.circle2View.bounds) / 2;
    self.circle2View.realWaveColor = [UIColor colorWithRed:0.173 green:0.973 blue:0.565 alpha:1.00];
    self.circle2View.maskWaveColor = [[UIColor colorWithRed:0.173 green:0.973 blue:0.565 alpha:1.00] colorWithAlphaComponent:0.4];
    self.circle2View.progress = 0.5;
    [self.circle2View startAnimation];
    
#pragma mark circle3View
    self.circle3View.realWaveColor = [UIColor colorWithRed:1.000 green:0.894 blue:0.494 alpha:1.00];
    self.circle3View.maskWaveColor = [[UIColor colorWithRed:1.000 green:0.894 blue:0.494 alpha:1.00] colorWithAlphaComponent:0.4];
    self.circle3View.progress = 0.5;
    [self.circle3View startAnimation];
    
#pragma mark rectangularView
    self.rectangularView.realWaveColor = [UIColor colorWithRed:0.973 green:0.247 blue:0.114 alpha:1.00];
    self.rectangularView.maskWaveColor = [[UIColor colorWithRed:0.973 green:0.247 blue:0.114 alpha:1.00] colorWithAlphaComponent:0.4];
    self.rectangularView.progress = 0.5;
    self.rectangularView.waveSpeed = 30;
    [self.rectangularView startAnimation];
}
- (IBAction)progressSliderAction:(id)sender {
    UISlider * slider = (UISlider *)sender;
    NSLog(@"progress:%f",slider.value);
    for (UIView * wave in self.view.subviews) {
        if ([wave isKindOfClass:[NEWave class]]) {
            ((NEWave *)wave).progress = slider.value;
        }
    }
}

- (IBAction)speedSliderAction:(id)sender {
    UISlider * slider = (UISlider *)sender;
    NSLog(@"speed:%f",slider.value);
    for (UIView * wave in self.view.subviews) {
        if ([wave isKindOfClass:[NEWave class]]) {
            ((NEWave *)wave).waveSpeed = slider.value;
        }
    }
}

- (IBAction)frequencySliderAction:(id)sender {
    UISlider * slider = (UISlider *)sender;
    NSLog(@"frequency:%f",slider.value);
    for (UIView * wave in self.view.subviews) {
        if ([wave isKindOfClass:[NEWave class]]) {
            ((NEWave *)wave).waveFrequency = slider.value;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
