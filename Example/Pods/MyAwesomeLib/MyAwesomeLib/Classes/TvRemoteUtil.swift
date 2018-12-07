//
//  TvOSUtil.swift
//  SimpleProjectUITests
//
//  Created by Denis Severinets on 12/6/18.
//  Copyright © 2018 Oxagile. All rights reserved.
//

import XCTest

/* Helper for Apple TV */
#if os(tvOS)
struct TvRemoteUtil {
    
    static private func doAction(remoteButton: XCUIRemoteButton, count: Int) -> Void {
        for _ in 1...count{
            Container.remote.press(remoteButton)
            sleep(1)
        }
    }
    
    static func goUP(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.up, count: count)
    }
    
    static func goDown(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.down, count: count)
    }
    
    static func goLeft(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.left, count: count)
    }
    
    static func goRight(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.right, count: count)
    }
    
    static func tapElement() -> Void {
        XCUIDevice.shared.press(.home)
       
        Container.device.press()
        Container.remote.press(.select)
        sleep(1)
    }
    
    static func tapPlayPause() -> Void {
        Container.remote.press(.playPause)
        sleep(1)
    }
    
    /*
     Take a screenshot of an app's first window
     */
    static func takeScreenshot() -> XCUIScreenshot {
        return Container.app.windows.firstMatch.screenshot()
    }
    
}
#endif
