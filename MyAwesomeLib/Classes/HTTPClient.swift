
import Alamofire
import XCTest

open class HTTPClient: XCTestCase {
    
    var requestExpectation: XCTestExpectation?
    
    open func execute<T: Decodable>(data: EndPoint,
                                        expect: String = "expectation",
                                        completion: @escaping (_ result: T, _ error: Error?) -> Void) {
   
        let manager = Alamofire.SessionManager.default
        var responseCode = 000
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        let request = manager.request(
            data.url,
            method: data.type,
            parameters: data.parameters,
            encoding: data.encoding,
            headers: data.headers
        )
        print(request.description)
        requestExpectation = expectation(description: expect)
        
        request.responseJSON { (response) -> Void in
            let result = response.data
            do {
                let decodedResult = try JSONDecoder().decode(T.self, from: result!)
                completion(decodedResult, nil)
                responseCode = response.response?.statusCode ?? 000
                print("Response: \(responseCode), \(response.value!))")
                self.requestExpectation?.fulfill()
            } catch let jsonError {
                XCTFail("Error serializing data: \(jsonError)")
            }
        }
        
        //Asynchronous method’s completion handler
        waitForExpectations(timeout: 20) { error in
            if (error != nil) {
                XCTFail("Error of request. Time is out.")
            } else {
                print("Completion of request")
            }
        }
    }
    
}


