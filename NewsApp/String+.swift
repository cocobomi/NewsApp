//
//  String+.swift
//  NewsApp
//
//  Created by donghyeon on 2022/03/12.
//

import Foundation
import UniformTypeIdentifiers

extension String {
    var htmlToString: String {
        guard let data = self.data(using: .utf8) else { return "" }
        
        do {
            return try NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            ).string
        } catch {
            return ""
        }
    }
}
