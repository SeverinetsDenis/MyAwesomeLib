//
//  IosExtensions.swift
//  SimpleProjectUITests
//
//  Created by Denis Severinets on 12/6/18.
//  Copyright © 2018 Oxagile. All rights reserved.
//

import XCTest

extension XCUIElement {
    
    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    @discardableResult
    public func clearAndTypeText(_ text: String) -> Void {
        self.waitUntilEnabled(timeout: WaitFor.animation)
        self.click()
        let stringValue = self.value as? String ?? ""
        let deleteString = Array(stringValue).map { _ in XCUIKeyboardKey.delete.rawValue }.joined(separator: "")
        self.typeText(deleteString)
        self.typeText(text)
        self.typeText(XCUIKeyboardKey.return.rawValue)
    }
    
    /**
     Scroll untill the element is visible
     */
    @discardableResult
    func scrollToElement(timeout: TimeInterval = 30) -> XCUIElement {
        let start = Date()
        while !self.visible() {
            let startPoint = Container.app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2))
            let finishPoint = Container.app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0))
            startPoint.press(forDuration:0, thenDragTo: finishPoint)
            if Date() > (start + timeout) {
                print("Impossible to find element within \(timeout) second")
                break
            }
        }
        return self
    }
    
    /**
     Check that element within a screen window
     */
    public func visible() -> Bool {
        guard self.exists && !self.frame.isEmpty else { return false }
        return Container.app.windows.element(boundBy: 0).frame.contains(self.frame)
    }
    
    /**
     Check that element is within a screen window, if not do scroll to get the element.
     */
    public func isVisible() -> Bool {
        if (!visible()){
            self.scrollToElement()
        }
        return self.isHittable
    }
    
    /**
     Wait an element then tap on it. If it's not possible try tap by coordinates
     */
    @discardableResult
    public func click() {
        if (self.waitUntilAppears(timeout: 4)){
            self.tap()
        } else {
            self.coordinate(withNormalizedOffset: CGVector(dx:0.1, dy:0.1)).tap()
        }
    }
    
    /**
     Usefull for elements that not support isSelected property.
     Required to add accessibilityValue = "selected" for such elements.
     */
    public var isElementSelected: Bool {
        return "selected" == String(describing: self.value ?? "")
    }
    
    /**
     Checking whether a video inside element is running
     */
    func isVideoRunningInside() -> Bool {
        sleep(3)
        var result = false
        XCTContext.runActivity(named: "Checking video is running inside the element") { (activity) in
            var screenshots = [self.screenshot()]
            sleep(1)
            screenshots.append(self.screenshot())
            sleep(1)
            screenshots.append(self.screenshot())
            result = screenshots[0].pngRepresentation != screenshots[1].pngRepresentation &&
                screenshots[1].pngRepresentation != screenshots[2].pngRepresentation
        }
        return result
    }
    
}

