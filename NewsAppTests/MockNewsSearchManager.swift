//
//  MockNewsSearchManager.swift
//  NewsAppTests
//
//  Created by donghyeon on 2022/03/13.
//

import Foundation
@testable import NewsApp

final class MockNewsSearchManager: NewsSearchManagerProtocol {
    var error: Error?
    var iscalledRequest = false
    
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping ([News]) -> Void
    ) {
        iscalledRequest = true
        
        if error == nil {
            completionHandler([])
        }
    }
}

