import XCTest

#if os(tvOS)
open class TvPage {
    
    open var isPageLoaded = false
    open var elementMatrix: [[XCUIElement]] {
        return [[]]
    }
    open lazy var focusNavigator: TvOSFocusNavigator {
        return TvOSFocusNavigator(matrix: elementMatrix)
    }
    
    public required init() {
        isPageLoaded = waitForPageLoaded()
    }
    
    open func waitForPageLoaded() -> Bool {
        return false
    }
    
}
#endif

