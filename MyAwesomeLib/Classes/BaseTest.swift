import XCTest

public class BaseTest: XCTestCase {
    
    static let autotestsMode = "Autotests"
    static let device = "iPhone"
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }
    
    /**
     Can be used for an iPad. Nothing will happen in an iPhone
     */
    static func rotateScreenRandomly() {
        if (Constants.currentDevice == device){
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
        Container.app.launchArguments.append(autotestsMode)
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
