MSRangeSlider
===============
[![Version](https://img.shields.io/cocoapods/v/MSRangeSlider.svg?style=flat)](http://cocoadocs.org/docsets/MSRangeSlider)
[![License](https://img.shields.io/cocoapods/l/MSRangeSlider.svg?style=flat)](http://cocoadocs.org/docsets/MSRangeSlider)
[![Platform](https://img.shields.io/cocoapods/p/MSRangeSlider.svg?style=flat)](http://cocoadocs.org/docsets/MSRangeSlider)


[[Overview](#overview) &bull; [Installation](#installation) &bull; [Demo](#demo) &bull; [Requirements](#requirements) &bull; [Licence](#licence)] 

<br>

![Alt text](https://raw.githubusercontent.com/sgl0v/MSRangeSlider/master/screenshots/sample.gif)

##<a name="overview"></a>Overview

Range slider control for iOS that looks similar to UISlider. It allows the user to select a range of values with two drag handles. The space between the handles is filled with a different background color to indicate those values are selected.

Compatible with iOS 8.0 (iPhone &amp; iPad) and higher.

## Installation

MSRangeSlider is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MSRangeSlider"
```

<b>Caveat</b> This control uses IB_DESIGNABLE. If you add it to your project via Interface Builder, you'll get warnings. To fix them you should do the following:

- use the latest version of cocoapods,
- add the `use_frameworks!` line to the podfile. 


## Demo

Build and run the <i>MSRangeSliderDemo</i> project in Xcode. The demo demonstrates how to use and integrate the MSRangeSlider into your project (via Interface Builder or manually).

##<a name="overview"></a>Requirements

- Requires iOS 8.0 or later
- Requires Automatic Reference Counting (ARC)
 
##<a name="licence"></a>Licence

`MSRangeSlider` is MIT-licensed. See `LICENSE`. 