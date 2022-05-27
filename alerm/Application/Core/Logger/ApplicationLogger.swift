//
//  ApplicationLogger.swift
//  Alerm
//
//  Created by shin.sekaryo on 2022/05/27.
//

import Foundation
import os

final class ApplicationLogger {
    private static let bundleId = Bundle.main.bundleIdentifier ?? ""
    
    private static let logger = Logger(subsystem: bundleId, category: "main")
    
    private static let messageSeparator = ": "
    
    private static let valuesSeparator = " "

    static func debug(message: String, values: Any...) {
        #if DEBUG
        let args = values.map { String(describing: $0) }
            .joined(separator: valuesSeparator)
        logger.debug("\(message)\(messageSeparator)\(args)")
        #endif
    }

    static func info(message: String, values: Any...) {
        let args = values.map { String(describing: $0) }
            .joined(separator: valuesSeparator)
        logger.debug("\(message)\(messageSeparator)\(args)")
    }
    
    static func error(error: Error) {
        let message = String(reflecting: error)
        logger.error("\(message)")
    }
    
    static func error(message: String, values: Any...) {
        let args = values.map { String(describing: $0) }
            .joined(separator: valuesSeparator)
        logger.debug("\(message)\(messageSeparator)\(args)")
    }
}
