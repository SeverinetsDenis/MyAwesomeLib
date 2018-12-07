//
//  IOSUtil.swift
//  SimpleProjectUITests
//
//  Created by Denis Severinets on 12/6/18.
//  Copyright © 2018 Oxagile. All rights reserved.
//

import XCTest

/* Helper for iOS */
struct IOSUtil {
    /**
     Scroll up by screen untill end of screen
     */
    @discardableResult
    static func scrollUpUntilEndOfScreen(timeout: TimeInterval = 20) -> Bool {
        let start = Date()
        var previousImage = Data()
        var currentImage = Container.app.screenshot().pngRepresentation
        while !(currentImage == previousImage) {
            previousImage = currentImage
            scrollUpByScreen()
            if Date() > (start + timeout) {
                print ("Didn't get end of screen within \(timeout) second")
                break
            }
            sleep(1)
            currentImage = Container.app.screenshot().pngRepresentation
        }
        return currentImage == previousImage
    }
    
    /**
     Scroll up by screen in percentage
     */
    static func scrollUpByScreen(percentageOfScreen : Int = 40) {
        let startPoint = Container.app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: Double(percentageOfScreen / 100)))
        let finishPoint = Container.app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0))
        startPoint.press(forDuration:0, thenDragTo: finishPoint)
    }
    
    /*
     Take a screenshot of an app's first window
     */
    static func takeScreenshot() -> Data {
        return Container.app.windows.firstMatch.screenshot().pngRepresentation
    }
    
    /*
     Bring app to background
     */
    static func bringAppToBackground() {
        sleep(1)
        Container.device.press(.home)
    }
    
    /*
     Bring app to foreground
     */
    static func bringAppToForeground() {
        sleep(1)
        Container.app.activate()
    }
}

