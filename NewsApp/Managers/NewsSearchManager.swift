//
//  NewsSearchManager.swift
//  NewsApp
//
//  Created by donghyeon on 2022/03/12.
//

import Alamofire
import Foundation

protocol NewsSearchManagerProtocol {
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping ([News]) -> Void
    )
}

struct NewsSearchManager: NewsSearchManagerProtocol {
    
    func request(
        from keyword: String,
        start: Int,
        display: Int,
        completionHandler: @escaping ([News]) -> Void
    ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/news.json")
            else { return }
        
        let parameters = NewsRequestModel(start: start, display: display, query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "Bk0CMDs1RoSMngnwZ0T3",
            "X-Naver-Client-Secret": "ruk6az4As1"
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: NewsResponseModel.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error)
                }
            }
            .resume()
    }
}
