//
//  BrightnessEditorViewController.swift
//  imglyKit
//
//  Created by Sascha Schwabbauer on 10/04/15.
//  Copyright (c) 2015 9elements GmbH. All rights reserved.
//

import UIKit

@objc(IMGLYBrightnessEditorViewController) public class BrightnessEditorViewController: SliderEditorViewController {

    // MARK: - SliderEditorViewController
    
    override public var minimumValue: Float {
        return -1
    }
    
    override public var maximumValue: Float {
        return 1
    }
    
    override public var initialValue: Float {
        return fixedFilterStack.brightnessFilter.brightness
    }
    
    override public func valueChanged(value: Float) {
        fixedFilterStack.brightnessFilter.brightness = slider.value
    }
    
}
