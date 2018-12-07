import XCTest

#if os(tvOS)
class TvPage {
    
    lazy var loader = Container.find(.image, "Loader")
    var isPageLoaded = false
    var elementMatrix: [[XCUIElement]] {
        return [[]]
    }
    lazy var focusNavigator: TvOSFocusNavigator {
        return TvOSFocusNavigator(matrix: elementMatrix)
    }
    
    required init() {
        isPageLoaded = waitForPageLoaded()
    }
    
    func waitForPageLoaded() -> Bool {
        return false
    }
    
}
#endif

