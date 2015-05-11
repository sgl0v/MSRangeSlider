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

@interface MSThumbView : UIView
@property (nonatomic, strong) CALayer *thumbLayer;
@end

@implementation MSThumbView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.thumbLayer = [CALayer layer];

        self.thumbLayer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:.4].CGColor;
        self.thumbLayer.borderWidth = .5;
        self.thumbLayer.cornerRadius = kRangeSliderHeight / 2;
        self.thumbLayer.backgroundColor = [UIColor whiteColor].CGColor;
        self.thumbLayer.shadowColor = [UIColor blackColor].CGColor;
        self.thumbLayer.shadowOffset = CGSizeMake(0.0, 3.0);
        self.thumbLayer.shadowRadius = 2;
        self.thumbLayer.shadowOpacity = 0.3f;
        [self.layer addSublayer:self.thumbLayer];
    }

    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    if (layer != self.layer) {
        return;
    }

    self.thumbLayer.bounds = CGRectMake(0, 0, kRangeSliderHeight, kRangeSliderHeight);
    self.thumbLayer.position = CGPointMake(kRangeSliderHeight / 2, kRangeSliderHeight / 2);
}

@end

@interface MSRangeSlider ()

@property (nonatomic, strong) CALayer *trackLayer;
@property (nonatomic, strong) CALayer *selectedTrackLayer;

@property (nonatomic, strong) UIView *fromThumbView;
@property (nonatomic, strong) UIView *toThumbView;

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

- (void)layoutSubviews
{
    [self ms_updateThumbsPosition];
}

- (void)setFromValue:(CGFloat)fromValue
{
    _fromValue = fromValue;
    [self ms_updateThumbsPosition];
}

- (void)setToValue:(CGFloat)toValue
{
    _toValue = toValue;
    [self ms_updateThumbsPosition];
}

- (void)setMinimumValue:(CGFloat)minimumValue
{
    _minimumValue = minimumValue;
    [self ms_updateThumbsPosition];
}

- (void)setMaximumValue:(CGFloat)maximumValue
{
    _maximumValue = maximumValue;
    [self ms_updateThumbsPosition];
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

    CGFloat from = CGRectGetMaxX(self.fromThumbView.frame);
    CGFloat to = CGRectGetMinX(self.toThumbView.frame);

    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue
                     forKey:kCATransactionDisableActions];
    self.selectedTrackLayer.frame = CGRectMake(0, 0, to - from, kRangeSliderTrackHeight);
    self.selectedTrackLayer.position = CGPointMake((from + to) / 2, height / 2);
    [CATransaction commit];
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
    self.trackTintColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    self.thumbTintColor = [UIColor whiteColor];

    self.trackLayer = [CALayer layer];
    self.trackLayer.backgroundColor = self.trackTintColor.CGColor;
    self.trackLayer.cornerRadius = 1.3;
    [self.layer addSublayer:self.trackLayer];

    self.selectedTrackLayer = [CALayer layer];
    self.selectedTrackLayer.backgroundColor = self.selectedTrackTintColor.CGColor;
    self.selectedTrackLayer.cornerRadius = 1.3;
    [self.layer addSublayer:self.selectedTrackLayer];

    self.fromThumbView = [[MSThumbView alloc] init];
    [self addSubview:self.fromThumbView];
    UIGestureRecognizer *fromGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ms_didPanFromThumbView:)];
    [self.fromThumbView addGestureRecognizer:fromGestureRecognizer];

    self.toThumbView = [[MSThumbView alloc] init];
    [self addSubview:self.toThumbView];
    UIGestureRecognizer *toGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(ms_didPanToThumbView:)];
    [self.toThumbView addGestureRecognizer:toGestureRecognizer];

    [self ms_updateThumbsPosition];
}

- (void)ms_updateThumbsPosition
{
    self.fromThumbView.bounds = CGRectMake(0, 0, kRangeSliderHeight, kRangeSliderHeight);
    self.fromThumbView.center = [self ms_thumbLocationForValue:self.fromValue offset:kRangeSliderHeight / 2];

    self.toThumbView.bounds = CGRectMake(0, 0, kRangeSliderHeight, kRangeSliderHeight);
    self.toThumbView.center = [self ms_thumbLocationForValue:self.toValue offset:-kRangeSliderHeight / 2];
}

- (void)ms_didPanFromThumbView:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan && gestureRecognizer.state != UIGestureRecognizerStateChanged) {
        return;
    }

    CGPoint location = [gestureRecognizer locationInView:self];
    self.fromValue = [self ms_valueForLocation:location];
    [self setNeedsLayout];
}

- (void)ms_didPanToThumbView:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan && gestureRecognizer.state != UIGestureRecognizerStateChanged) {
        return;
    }

    CGPoint location = [gestureRecognizer locationInView:self];
    self.toValue = [self ms_valueForLocation:location];
    [self setNeedsLayout];
}

- (CGFloat)ms_valueForLocation:(CGPoint)location
{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat x = MIN(MAX(location.x, kRangeSliderHeight / 2), width - kRangeSliderHeight / 2);

    return self.minimumValue + (self.maximumValue - self.minimumValue) * (x - kRangeSliderHeight / 2) / (width - kRangeSliderHeight);
}

- (CGPoint)ms_thumbLocationForValue:(CGFloat)value offset:(CGFloat)offset
{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat toThumbCoordX = width * (value - self.minimumValue) / (self.maximumValue - self.minimumValue) + offset;

    return CGPointMake(toThumbCoordX, height / 2);
}

@end
