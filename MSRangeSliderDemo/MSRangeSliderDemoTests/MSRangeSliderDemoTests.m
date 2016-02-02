//
// MSRangeSliderDemoTests.m
//
// Created by Maksym Shcheglov on 2015-05-08.
// Copyright (c) 2015 Maksym Shcheglov.
// License: http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <MSRangeSlider/MSRangeSlider.h>

@interface MSRangeSliderDemoTests : XCTestCase
@property(nonatomic, strong) MSRangeSlider* rangeSlider;
@end

@implementation MSRangeSliderDemoTests

- (void)setUp
{
    [super setUp];
    self.rangeSlider = [[MSRangeSlider alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
}

- (void)testSliderCreation
{
    XCTAssertNotNil(self.rangeSlider);
}

- (void)testMaxMinPropertiesConsistency
{
    self.rangeSlider.maximumValue = 100;
    self.rangeSlider.minimumValue = 0;
    self.rangeSlider.minimumInterval = 100;
    XCTAssertEqual(self.rangeSlider.maximumValue, 100);
    XCTAssertEqual(self.rangeSlider.minimumValue, 0);

    self.rangeSlider.maximumValue = 60;
    self.rangeSlider.minimumValue = 20;
    XCTAssertEqual(self.rangeSlider.minimumInterval, 40);
}

- (void)testFromToPropertiesConsistency
{
    self.rangeSlider.minimumInterval = 10;
    self.rangeSlider.maximumValue = 100;
    self.rangeSlider.minimumValue = 0;
    self.rangeSlider.fromValue = 10;
    self.rangeSlider.toValue = 40;
    XCTAssertEqual(self.rangeSlider.fromValue, 10);
    XCTAssertEqual(self.rangeSlider.toValue, 40);

    self.rangeSlider.fromValue = -10;
    self.rangeSlider.toValue = 110;
    XCTAssertEqual(self.rangeSlider.fromValue, 0);
    XCTAssertEqual(self.rangeSlider.toValue, 100);

    self.rangeSlider.fromValue = 10;
    self.rangeSlider.toValue = 20;
    self.rangeSlider.minimumInterval = 20;
    XCTAssertEqual(self.rangeSlider.fromValue, 10);
    XCTAssertEqual(self.rangeSlider.toValue, 30);
}

@end
