import XCTest

open class Constants {
    open static let CountryCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String ?? "US"
    open static let LanguageCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.languageCode) as? String ?? "en"
    open static var currentDevice: String {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return "iPhone"
        case .pad:
            return "iPad"
        case .tv:
            return "Apple_TV"
        case .carPlay:
            return "Car_Play"
        default:
            return "Unknown_Device"
        }
    }
}

public struct Platform {
    public static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
        isSim = true
        #endif
        return isSim
    }()
}



