//
// MSRangeSlider.m
//
// Created by Maksym Shcheglov on 2015-05-07.
// Copyright (c) 2015 Maksym Shcheglov.
// License: http://opensource.org/licenses/MIT
//

#import "MSRangeSlider.h"

static CGFloat const kRangeSliderTrackHeight = 2.0f;
static CGFloat const kRangeSliderHeight = 28.0f;

@interface MSRangeSlider ()

@property (nonatomic, strong) CALayer *fromThumbLayer;
@property (nonatomic, strong) CALayer *toThumbLayer;
@property (nonatomic, strong) CALayer *trackLayer;
@property (nonatomic, strong) CALayer *selectedTrackLayer;

@end

@implementation MSRangeSlider

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        [self ms_init];
    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self ms_init];
    }

    return self;
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, kRangeSliderHeight);
}

#pragma mark - CALayerDelegate

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    if (layer != self.layer) {
        return;
    }

    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    self.trackLayer.bounds = CGRectMake(0, 0, width, kRangeSliderTrackHeight);
    self.trackLayer.position = CGPointMake(width / 2, height / 2);

    self.selectedTrackLayer.bounds = CGRectMake(0, 0, width, kRangeSliderTrackHeight);
    self.selectedTrackLayer.position = CGPointMake(width / 2, height / 2);

    self.fromThumbLayer.bounds = CGRectMake(0, 0, kRangeSliderHeight, kRangeSliderHeight);
    self.fromThumbLayer.position = CGPointMake(0, height / 2);

    self.toThumbLayer.bounds = CGRectMake(0, 0, kRangeSliderHeight, kRangeSliderHeight);
    self.toThumbLayer.position = CGPointMake(width, height / 2);
}

#pragma mark - Private methods

- (void)ms_init
{
    self.minimumValue = 0.0;
    self.maximumValue = 1.0;
    self.fromValue = 0.0;
    self.toValue = 1.0;
    self.minimumInterval = 0.1;

    self.selectedTrackTintColor = [UIColor colorWithRed:0.0 green:122.0 / 255.0 blue:1.0 alpha:1.0];
    self.trackTintColor = [UIColor lightGrayColor];
    self.thumbTintColor = [UIColor whiteColor];

    self.trackLayer = [CALayer layer];
    self.trackLayer.backgroundColor = self.trackTintColor.CGColor;
    self.trackLayer.cornerRadius = 1.3;
    [self.layer addSublayer:self.trackLayer];

    self.selectedTrackLayer = [CALayer layer];
    self.selectedTrackLayer.backgroundColor = self.selectedTrackTintColor.CGColor;
    self.selectedTrackLayer.cornerRadius = 1.3;
    [self.layer addSublayer:self.selectedTrackLayer];

    self.fromThumbLayer = [self ms_createThumbLayer];
    [self.layer addSublayer:self.fromThumbLayer];
    self.toThumbLayer = [self ms_createThumbLayer];
    [self.layer addSublayer:self.toThumbLayer];
}

- (CALayer *)ms_createThumbLayer
{
    CALayer *thumbLayer = [CALayer layer];

    thumbLayer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.4].CGColor;
    thumbLayer.borderWidth = .5;
    thumbLayer.cornerRadius = kRangeSliderHeight / 2;
    thumbLayer.backgroundColor = self.thumbTintColor.CGColor;
    thumbLayer.shadowColor = [UIColor blackColor].CGColor;
    thumbLayer.shadowOffset = CGSizeMake(0.0, 3.0);
    thumbLayer.shadowRadius = 3;
    thumbLayer.shadowOpacity = 0.2f;
    return thumbLayer;
}

@end
