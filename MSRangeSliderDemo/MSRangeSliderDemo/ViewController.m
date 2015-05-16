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
@property (nonatomic, weak) IBOutlet MSRangeSlider *ibRangeSlider;
@property (nonatomic, strong) MSRangeSlider *rangeSlider;
@property (nonatomic, weak) IBOutlet UILabel *rangeLabel1;
@property (nonatomic, weak) IBOutlet UILabel *rangeLabel2;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.rangeSlider = [[MSRangeSlider alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
    self.rangeSlider.maximumValue = 100;
    self.rangeSlider.minimumValue = 0;
    self.rangeSlider.minimumInterval = 10;
    self.rangeSlider.fromValue = 10;
    self.rangeSlider.toValue = 20;
    self.rangeSlider.selectedTrackTintColor = [UIColor brownColor];
    self.rangeSlider.trackTintColor = [UIColor greenColor];
    self.rangeSlider.thumbTintColor = [UIColor brownColor];
    [self.view addSubview:self.rangeSlider];
    [self.rangeSlider addTarget:self action:@selector(ms_didChangeValue2:) forControlEvents:UIControlEventValueChanged];

    [self ms_didChangeValue1:self.ibRangeSlider];
    [self ms_didChangeValue2:self.rangeSlider];
}

- (void)viewDidLayoutSubviews
{
    self.rangeSlider.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMaxY(self.rangeLabel2.frame) + 25);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ms_didChangeValue1:(MSRangeSlider *)sender
{
    self.rangeLabel1.text = [NSString stringWithFormat:@"%.f - %.f", sender.fromValue, sender.toValue];
}

- (IBAction)ms_didChangeValue2:(MSRangeSlider *)sender
{
    self.rangeLabel2.text = [NSString stringWithFormat:@"%.f - %.f", sender.fromValue, sender.toValue];
}

@end
