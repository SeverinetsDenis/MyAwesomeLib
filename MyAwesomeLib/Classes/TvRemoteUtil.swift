
import XCTest

/* Helper for Apple TV */
#if os(tvOS)
open class TvRemoteUtil {
    
    private func doAction(remoteButton: XCUIRemoteButton, count: Int) -> Void {
        for _ in 1...count{
            Container.remote.press(remoteButton)
            sleep(1)
        }
    }
    
    open static func goUP(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.up, count: count)
    }
    
    open static func goDown(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.down, count: count)
    }
    
    open static func goLeft(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.left, count: count)
    }
    
    open static func goRight(count: Int = 1) -> Void {
        doAction(remoteButton: XCUIRemoteButton.right, count: count)
    }
    
    open static func tapElement() -> Void {
        Container.remote.press(.select)
        sleep(1)
    }
    
    open static func tapPlayPause() -> Void {
        Container.remote.press(.playPause)
        sleep(1)
    }
    
    /*
     Take a screenshot of an app's first window
     */
    open static func takeScreenshot() -> XCUIScreenshot {
        return Container.app.windows.firstMatch.screenshot()
    }
    
}
#endif
