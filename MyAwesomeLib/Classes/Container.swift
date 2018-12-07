
import Foundation
import XCTest

open class Container {
    //To know the buldle ID of app use adb command in terminal like:
    //  ideviceinstaller --udid 6a179e90ede449e5f77837a2370faae5ff944f2a -l
    //static var app: XCUIApplication = XCUIApplication(bundleIdentifier: "com.oxagile.someplay")
    open static var app: XCUIApplication = XCUIApplication()
    open static var device: XCUIDevice = XCUIDevice.shared
    #if os(tvOS)
        open static let remote: XCUIRemote = XCUIRemote.shared()
    #endif
    
    /* Find element by part of label, identifier of placeHolder value */
    open static func find(_ type: XCUIElement.ElementType, _ partOfName: String) -> XCUIElement {
        let predicate = NSPredicate(format: "identifier CONTAINS[c] %@ OR label CONTAINS[c] %@ OR placeholderValue CONTAINS[c] %@", partOfName, partOfName, partOfName)
        return getElement(type, predicate)
    }
    
    /* Find all elements by element type */
    open static func findAll(_ type: XCUIElement.ElementType) -> XCUIElementQuery {
        return Container.app.descendants(matching: type)
    }
    
    private static func getElement(_ type: XCUIElement.ElementType, _ predicate: NSPredicate) -> XCUIElement {
        var result: XCUIElement?
        switch type {
        case .button :
            return Container.app.buttons.containing(predicate).firstMatch
        case .staticText :
            return Container.app.staticTexts.containing(predicate).firstMatch
        case .textField :
            return Container.app.textFields.containing(predicate).firstMatch
        case .secureTextField :
            return Container.app.secureTextFields.containing(predicate).firstMatch
        case .switch :
            return Container.app.switches.containing(predicate).firstMatch
        case .cell :
            return Container.app.cells.containing(predicate).firstMatch
        case .checkBox :
            return Container.app.checkBoxes.containing(predicate).firstMatch
        case .navigationBar :
            return Container.app.navigationBars.containing(predicate).firstMatch
        case .other :
            return Container.app.otherElements.containing(predicate).firstMatch
        default:
            return Container.app.staticTexts.containing(predicate).firstMatch
        }
    }
}
