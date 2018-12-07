
import Foundation
import XCTest

open class Page {
    
    open var isPageLoaded = false
    
    /**
     Should be overridden by any Page with logic for waiting all animation completed
     */
    open func waitForPageLoaded() -> Bool {
        return false
    }
    
    /**
     Can be used when it's needed to relaunch app from particular page and return it
     */
    open func relaunchApp<T: Page>(_ type: T.Type) -> T {
        Container.app.launchArguments.removeAll()
        Container.app.launch()
        return type.init()
    }
    
    /**
     Initialiser where parameter isPageLoaded is set to true or false depending on the result of waitForPageLoaded() method
     */
    public required init() {
        isPageLoaded = waitForPageLoaded()
    }
    
    /**
     Can be used when we go to external applications
     */
    open func isApplicationInBackground() -> Bool {
        return UIApplication.shared.applicationState == .background
    }
    
    /*
     Take a screenshot of an app's first window
     */
    open func takeScreenshot() -> Data {
        return Container.app.windows.firstMatch.screenshot().pngRepresentation
    }
    
}
