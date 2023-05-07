//
//  DateFormatted + Shared.swift
//  Alamofire
//
//  Created by Car mudi on 06/02/23.
//

extension DateFormatter {
    
    static private var shared: DateFormatter?
    
    /**
     Returns shared `DateFormatter` instance.
     */
    public static func sharedInstance(
        locale: Locale = Locale.current
    ) -> DateFormatter {
        
        if let validFormatter = shared {
            return validFormatter
        }
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Asia/Jakarta")
        formatter.locale = locale
        
        shared = formatter
        
        return formatter
    }
    
    public static func reset() {
        shared = nil
    }
}
