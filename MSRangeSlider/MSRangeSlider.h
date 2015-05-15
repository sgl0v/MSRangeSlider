//
// MSRangeSlider.h
//
// Created by Maksym Shcheglov on 2015-05-07.
// Copyright (c) 2015 Maksym Shcheglov.
// License: http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface MSRangeSlider : UIControl

//! @abstract The left handle's position. The default value is 0.0. this value will be pinned to min/max.
@property (nonatomic, assign) CGFloat fromValue;
//! @abstract The right handle's position. The default value is 1.0. this value will be pinned to min/max.
@property (nonatomic, assign) CGFloat toValue;
//! @abstract The slider's minimum value. The default value is 0.0. Should be lower than maximumValue.
@property (nonatomic, assign) CGFloat minimumValue;
//! @abstract The slider's maximum value. The default value is 1.0. Should be higher than minimumValue.
@property (nonatomic, assign) CGFloat maximumValue;
//! @abstract The minimum diapason between sliders. The default value is 0.1.
@property (nonatomic, assign) CGFloat minimumInterval;
//! @abstract The color used to tint the selected range.
@property (nonatomic, strong) UIColor *selectedTrackTintColor UI_APPEARANCE_SELECTOR;
//! @abstract The color used to tint the unselected range.
@property (nonatomic, strong) UIColor *trackTintColor UI_APPEARANCE_SELECTOR;
//! @abstract The color used to tint the thumbs.
@property (nonatomic, strong) UIColor *thumbTintColor UI_APPEARANCE_SELECTOR;

@end
NS_ASSUME_NONNULL_END
