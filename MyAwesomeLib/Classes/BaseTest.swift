import XCTest

open class BaseTest: XCTestCase {
    
    open static let autotestsMode = "Autotests"
    open static let device = "iPhone"
    
    open override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }
    
    /**
     Can be used for an iPad. Nothing will happen in an iPhone
     */
    open static func rotateScreenRandomly() {
        if (Constants.currentDevice == device){
            let orientations: Set<UIDeviceOrientation> = [.landscapeLeft, .landscapeRight, .portrait, .portraitUpsideDown]
            Container.device.orientation = orientations.randomObject()!
        }
    }
    
    /**
     Can be used for launching app with arguments
     */
    open static func launchAppWithArguments(_ args: [String]) {
        Container.app.launchArguments.removeAll()
        Container.app.launchArguments.append(contentsOf: args)
        Container.app.launchArguments.append(autotestsMode)
        Container.app.launch()
    }
    
    /**
     Can be used when we need to relaunch app without resetting data
     */
    open static func launchAppWithoutReset() {
        Container.app.launchArguments.removeAll()
        Container.app.launch()
    }
    
    /**
     It's need to remove all arguments at the and of test class
     */
    open override class func tearDown() {
        Container.app.launchArguments.removeAll()
    }
}
