//
//  ElementNavigator.swift
//
import Foundation
import XCTest

#if os(tvOS)
class TvFocusNavigator {    
    
    /*Need to override the matrix elements inside each tv page*/
    var elementsMatrix: [[XCUIElement]]
    
    init(matrix: [[XCUIElement]]) {
        elementsMatrix = matrix
    }
        
    private func selectedElementVerticalLocation() -> Int {
        var rowNumber = 0
        for (i, row) in elementsMatrix.enumerated() {
            for element in row {
                if element.exists, element.hasFocus {
                    rowNumber = i
                    return rowNumber
                }
            }
        }
        return rowNumber
    }
    
    private func selectedElementHorizontalLocation() -> Int {
        var number = 0
        for row in elementsMatrix {
            for (i, element) in row.enumerated() {
                if element.exists, element.hasFocus {
                    number = i
                    return number
                }
            }
        }
        return number
    }
    
    private func locationOfElement(_ element: XCUIElement) -> (Int, Int) {
        var rowNumber = 0
        var order = 0
        for (i, row) in elementsMatrix.enumerated() {
            for (j, el) in row.enumerated() {
                if el == element {
                    rowNumber = i
                    order = j
                    return (rowNumber, order)
                }
            }
        }
        return (rowNumber, order)
    }
    
    private func getFocusedElement() -> XCUIElement! {
        for (_, row) in elementsMatrix.enumerated() {
            for (_, el) in row.enumerated() {
                if el.exists && el.hasFocus {
                    return el
                }
            }
        }
        XCTFail("!!! Didn't get a focused element")
        return nil
    }
    
    func setFocusToElement(_ element: XCUIElement) -> Void {
        if (!self.checkMatrixOfElementsIsEmpty()) {
            XCTContext.runActivity(named: "Set focus on an element \(element.label)") {_ in
                let destinatedElement = locationOfElement(element)
                let verticalOffset = selectedElementVerticalLocation() - destinatedElement.0
                let verticalDirection: XCUIContainer.remoteButton = (verticalOffset > 0) ? .up : .down
                if verticalOffset != 0 {
                    for _ in 0..<abs(verticalOffset) {
                        Container.remote.press(verticalDirection)
                        sleep(1)
                    }
                }
                let horizontalOffset = selectedElementHorizontalLocation() - destinatedElement.1
                let horizontalDirection: XCUIContainer.remoteButton = (horizontalOffset > 0) ? .left : .right
                if horizontalOffset != 0 {
                    for _ in 0..<abs(horizontalOffset) {
                        Container.remote.press(horizontalDirection)
                        sleep(1)
                    }
                }
            }
        }
    }
    
    func setFocusToElement(y: Int, x: Int) -> XCUIElement! {
        if (!self.checkMatrixOfElementsIsEmpty()) {
            XCTContext.runActivity(named: "Set focus on an element (y, x) = (\(y + 1), \(x + 1))") {_ in
                let destinatedElement = (y, x)
                let verticalOffset = selectedElementVerticalLocation() - destinatedElement.0
                let verticalDirection: XCUIContainer.remoteButton = (verticalOffset > 0) ? .up : .down
                if verticalOffset != 0 {
                    for _ in 0..<abs(verticalOffset) {
                        Container.remote.press(verticalDirection)
                        sleep(1)
                    }
                }
                let horizontalOffset = selectedElementHorizontalLocation() - destinatedElement.1
                let horizontalDirection: XCUIContainer.remoteButton = (horizontalOffset > 0) ? .left : .right
                if horizontalOffset != 0 {
                    for _ in 0..<abs(horizontalOffset) {
                        Container.remote.press(horizontalDirection)
                        sleep(1)
                    }
                }
            }
            return getFocusedElement()
        }
        return nil
    }
    
    func setFocusToRandomElement() -> XCUIElement {
        let y = OxaRandom.getNumber(min: 1, max: self.elementsMatrix.count)
        let x = OxaRandom.getNumber(min: 1, max: self.elementsMatrix[0].count)
        return self.setFocusToElement(y: y - 1, x: x - 1)
    }
    
    //Check if matrix of elements has at least one an existing element
    private func checkMatrixOfElementsIsEmpty() -> Bool {
        for list in self.elementsMatrix {
            for element in list {
                if (element.exists) {
                    return false
                }
            }
        }
        XCTFail("!!! Can not navigate by matrix of elements as it's empty")
        return true        
    }
}
#endif
