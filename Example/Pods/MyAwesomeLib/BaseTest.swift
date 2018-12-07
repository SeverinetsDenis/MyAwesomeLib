//
//  BaseTest.swift
//  Copyright © 2017 Oxagile. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }
    
    /**
     Can be used for an iPad. Nothing will happen in an iPhone
     */
    static func rotateScreenRandomly() {
        if (Constants.currentDevice == "iPhone"){
            let orientations: Set<UIDeviceOrientation> = [.landscapeLeft, .landscapeRight, .portrait, .portraitUpsideDown]
            Container.device.orientation = orientations.randomObject()!
        }
    }
    
    /**
     Can be used for launching app with arguments
     */
    static func launchAppWithArguments(_ args: [String]) {
        Container.app.launchArguments.removeAll()
        Container.app.launchArguments.append(contentsOf: args)
        Container.app.launchArguments.append(LaunchArguments.autotestsMode)
        Container.app.launch()
    }
    
    /**
     Can be used when we need to relaunch app without resetting data
     */
    static func launchAppWithoutReset() {
        Container.app.launchArguments.removeAll()
        Container.app.launch()
    }
    
    /**
     It's need to remove all arguments at the and of test class
     */
    override class func tearDown() {
        Container.app.launchArguments.removeAll()
    }
}
