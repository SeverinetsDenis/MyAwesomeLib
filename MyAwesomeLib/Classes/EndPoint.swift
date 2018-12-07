
import Alamofire

public struct EndPoint {
    
    public var headers = [String:String]()
    public var encoding: ParameterEncoding = URLEncoding.default
    public var type = HTTPMethod.get
    public var url = ""
    public var keyPath = ""
    public var parameters = [String:Any]()
    public var returnedObject: Any
    
    public init(headers:[String:String], encoding:ParameterEncoding, type:HTTPMethod,
                url:String, keyPath:String, parameters:[String:Any], returnedObject:Any) {
        self.headers = headers
        self.encoding = encoding
        self.type = type
        self.url = url
        self.keyPath = keyPath
        self.parameters = parameters
        self.returnedObject = returnedObject
    }
}
