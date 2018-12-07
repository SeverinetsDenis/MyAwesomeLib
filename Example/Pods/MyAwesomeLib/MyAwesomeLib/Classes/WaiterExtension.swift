
import XCTest

extension XCUIElement {
    
    private func waitByCondition (condition: () -> Bool, timeout: TimeInterval) -> Bool {
        let start = Date()
        while (Date() < start + timeout) {
            if (condition()){
                return true
            } else {
                sleep(1)
            }
        }
        return false
    }
        
    /*
     Waiting for element appears
     - Parameter timeout: time in seconds
     */
    @discardableResult
    public func waitUntilAppears(timeout: TimeInterval = 10) -> Bool {
        return waitByCondition(condition: {self.exists && self.isHittable}, timeout: timeout)
        //let predicate = NSPredicate(format: "isHittable == true")
        //let expect = XCTestCase().expectation(for: predicate, evaluatedWith: self)
        //let expect = XCTKVOExpectation(keyPath: "isHittable", object: self, expectedValue: true)
    }
    
    public func waitUntilSelected(timeout: TimeInterval = 10) -> Bool {
        return waitByCondition(condition: {self.isSelected}, timeout: timeout)
    }
    
    @discardableResult
    public func waitUntilEnabled(timeout: TimeInterval = 5) -> Bool {
        return waitByCondition(condition: {self.isEnabled}, timeout: timeout)
    }
    
    public func waitUntilExists(timeout: TimeInterval = 10) -> Bool {
        return waitByCondition(condition: {self.exists}, timeout: timeout)
    }
    
    /**
     Waiting for label of element changed value
     Use this to make sure a video is downloaded
     - Parameter timeout: time in seconds
     */
    @discardableResult
    func waitUntilLabelIsChangedTo(expectedLabel: String, timeout: TimeInterval = 60) -> Bool {
        return waitByCondition(condition: {self.exists && self.label == expectedLabel}, timeout: timeout)
    }
    
    /**
     Waiting for element disppears
     - Parameter timeout: time in seconds
     */
    @discardableResult
    public func waitUntilDisappears(timeout: TimeInterval = 5) -> Bool {
        return waitByCondition(condition: {self.exists == false}, timeout: timeout)
    }
    
}
