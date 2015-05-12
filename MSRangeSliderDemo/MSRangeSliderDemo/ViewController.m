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
@property (nonatomic, weak) IBOutlet UILabel *range;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
