//
// ViewController.m
//
// Created by Maksym Shcheglov on 2015-05-08.
// Copyright (c) 2015 Maksym Shcheglov.
// License: http://opensource.org/licenses/MIT
//

#import "ViewController.h"
#import <MSRangeSlider/MSRangeSlider.h>

@interface ViewController ()
@property (nonatomic, weak) IBOutlet MSRangeSlider *rangeSlider;
@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *range;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.rangeSlider.maximumValue = 100;
    self.rangeSlider.minimumValue = 0;
    self.rangeSlider.minimumInterval = 20;
    self.rangeSlider.fromValue = 20;
    self.rangeSlider.toValue = 30;

//    [[MSRangeSlider appearance] setSelectedTrackTintColor:[UIColor redColor]];
//    [[MSRangeSlider appearance] setTrackTintColor:[UIColor greenColor]];
//    [[MSRangeSlider appearance] setThumbTintColor:[UIColor blueColor]];
//    self.slider.minimumTrackTintColor = [UIColor redColor];
//    self.slider.maximumTrackTintColor = [UIColor greenColor];
//    self.slider.thumbTintColor = [UIColor blueColor];

    [self ms_didChangeValue:self.rangeSlider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ms_didChangeValue:(MSRangeSlider *)sender
{
    self.range.text = [NSString stringWithFormat:@"%.2f - %.2f", sender.fromValue, sender.toValue];
}

@end
