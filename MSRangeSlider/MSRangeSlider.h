//
// MSRangeSlider.h
//
// Created by Maksym Shcheglov on 2015-05-07.
// Copyright (c) 2015 Maksym Shcheglov.
// License: http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>

@interface MSRangeSlider : UIControl

//! @abstract The left handle's position. default 0.0. this value will be pinned to min/max
@property (nonatomic, assign) CGFloat fromValue;
//! @abstract The right handle's position. default 1.0. this value will be pinned to min/max
@property (nonatomic, assign) CGFloat toValue;
//! @abstract The slider's minimum value. The default value is 0.0.
@property (nonatomic, assign) CGFloat minimumValue;
//! @abstract The slider's maximum value. The default value is 1.0.
@property (nonatomic, assign) CGFloat maximumValue;
//! @abstract The minimum diapason between sliders.
@property (nonatomic, assign) CGFloat minimumInterval;

@property (nonatomic, retain) UIColor *selectedTrackTintColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *trackTintColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *thumbTintColor UI_APPEARANCE_SELECTOR;

@end
